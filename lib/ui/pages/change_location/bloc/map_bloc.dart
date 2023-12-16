import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/common/services/repository/geocoder_repository.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final GeocoderRepository _repository;

  MapBloc({required GeocoderRepository repository})
      : _repository = repository,
        super(const MapState.loading()) {
    on<MapEvent>(
      (event, emit) => event.map(
        started: (value) => _onStarted(value, emit),
        changeByMap: (value) => _onChangeByMap(value, emit),
        changeByAddress: (value) => _onChangeByAddress(value, emit),
        scrollStarted: (value) => _onScrollStarted(value, emit),
      ),
    );
  }

  void _onStarted(_Started value, Emitter<MapState> emit) async {}

  void _onChangeByMap(_ChangeByMap value, Emitter<MapState> emit) async {
    try {
      emit(const MapState.loading());
      final res = await _repository.getAddress(value.address);
      emit(
        MapState.success(
          MapModel(
            address: res,
            latitude: value.address.latitude,
            longitude: value.address.longitude,
          ),
        ),
      );
    } catch (e) {
      emit(MapState.error(e.toString()));
    }
  }

  void _onChangeByAddress(_ChangeByAddress value, Emitter<MapState> emit) {}

  void _onScrollStarted(_ScrollStarted value, Emitter<MapState> emit) {
    try {
      emit(const MapState.hasScroll());
    } catch (e) {
      emit(MapState.error(e.toString()));
    }
  }
}
