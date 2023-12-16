import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    final model = MapModel(
      address: "test",
      latitude: _kDefaultPoint.latitude,
      longitude: _kDefaultPoint.longitude,
    );
    Hive.box("locations").put(model.id, model);
    print(model.key);
  }

  static const String from = "Qayerdan";
  static const String to = "Qayerga";

  static const Point _kDefaultPoint =
      Point(latitude: 43.4343, longitude: 34.3434);

  void changeFirst(MapModel newValue) {
    emit(state.copyWith(first: newValue));
  }

  void changeSecond(MapModel newValue) {
    emit(state.copyWith(second: newValue));
  }
}
