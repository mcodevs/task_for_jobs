import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/common/constants/icons.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'ways_event.dart';

part 'ways_state.dart';

part 'ways_bloc.freezed.dart';

class WaysBloc extends Bloc<WaysEvent, WaysState> {
  final BuildContext context;

  WaysBloc(this.context) : super(const WaysState.initial()) {
    on<WaysEvent>((event, emit) => event.map(
          getDirections: (value) => _onGetDirections(value, emit),
          clear: (value) => _onClear(value, emit),
        ));
  }

  void _onGetDirections(_GetDirections value, Emitter<WaysState> emit) {
    final Map<String, MapModel> arguments =
        (ModalRoute.of(context)?.settings.arguments as Map? ?? {})
            .cast<String, MapModel>();

    if (arguments.length != 2) {
      emit(const WaysState.error("Yo'nalishlarda xatolik mavjud"));
    } else {
      final objects = arguments.map(
        (key, value) => MapEntry(
          key,
          PlacemarkMapObject(
            mapId: MapObjectId(value.id),
            point: Point(latitude: value.latitude, longitude: value.longitude),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    key == "first" ? AppIcons.userIcon : AppIcons.userIconBlue),
              ),
            ),
          ),
        ),
      ).values.toList();
      emit(WaysState.loading(objects));
    }
  }

  void _onClear(_Clear value, Emitter<WaysState> emit) {}
}
