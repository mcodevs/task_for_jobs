import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/ui/pages/home/models/map_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState.loading()) {
    on<MapEvent>(
      (event, emit) => event.map(
        started: (value) => _onStarted(value, emit),
        changeByMap: (value) => _onChangeByMap(value, emit),
        changeByAddress: (value) => _onChangeByAddress(value, emit),
        scrollStarted: (value) => _onScrollStarted(value, emit),
      ),
    );
  }

  void _onStarted(_Started value, Emitter<MapState> emit) async {
    try {} catch (e) {}
  }

  void _onChangeByMap(_ChangeByMap value, Emitter<MapState> emit) {
    try {
      emit(
        const MapState.success(
          MapModel(
            address: "ds",
            point: Point(latitude: 45.4545, longitude: 34.3434),
          ),
        ),
      );
    } catch (e) {}
  }

  void _onChangeByAddress(_ChangeByAddress value, Emitter<MapState> emit) {
    try {} catch (e) {}
  }

  void _onScrollStarted(_ScrollStarted value, Emitter<MapState> emit) {
    try {
      emit(const MapState.hasScroll());
    } catch (e) {}
  }
}
