
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/common/constants/icons.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'ways_event.dart';

part 'ways_state.dart';

part 'ways_bloc.freezed.dart';

class WaysBloc extends Bloc<WaysEvent, WaysState> {
  final BuildContext context;

  WaysBloc(this.context) : super(const WaysState.initial()) {
    on<WaysEvent>(
      (event, emit) => event.map(
        getDirections: (value) => _onGetDirections(value, emit),
        clear: (value) => _onClear(value, emit),
      ),
    );
  }

  void _onGetDirections(_GetDirections value, Emitter<WaysState> emit) async {
    final Map<String, MapModel> arguments =
        (ModalRoute.of(context)?.settings.arguments as Map? ?? {})
            .cast<String, MapModel>();

    if (arguments.length != 2) {
      emit(const WaysState.error("Yo'nalishlarda xatolik mavjud"));
    } else {
      final MapModel from = arguments.values.first;
      final MapModel to = arguments.values.last;

      final List<MapObject> objects = [];
      objects.addAll(arguments
          .map((k, v) => MapEntry(
              k,
              PlacemarkMapObject(
                mapId: MapObjectId(v.id),
                point: v.toPoint(),
                icon: PlacemarkIcon.single(
                  PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                      k == "first" ? AppIcons.userIcon : AppIcons.userIconBlue,
                    ),
                  ),
                ),
              )))
          .values);
      emit(WaysState.loading(objects));
      final resultWithSession = YandexDriving.requestRoutes(
        points: [
          RequestPoint(
            point: from.toPoint(),
            requestPointType: RequestPointType.wayPoint,
          ),
          RequestPoint(
            point: to.toPoint(),
            requestPointType: RequestPointType.wayPoint,
          ),
        ],
        drivingOptions: const DrivingOptions(
          initialAzimuth: 0,
          routesCount: 5,
          avoidTolls: true,
        ),
      );
      final result = await resultWithSession.result;

      if (result.error != null) {
        emit(WaysState.error(result.error!));
        return;
      }
     if(result.routes?.isNotEmpty ?? false) {
       final polyline = result.routes!.reduce((v, e) =>
       v.metadata.weight.distance.value! > e.metadata.weight.distance.value!
           ? e
           : v);
       objects.add(
         PolylineMapObject(
           mapId: const MapObjectId("polyline"),
           polyline: Polyline(points: polyline.geometry),
           strokeColor: AppColors.primary,
           strokeWidth: 3,
         ),
       );
     }
      emit(WaysState.success(objects));
    }
  }

  void _onClear(_Clear value, Emitter<WaysState> emit) {
    emit(const WaysState.success([]));
  }
}
