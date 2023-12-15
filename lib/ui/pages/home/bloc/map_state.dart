part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.hasScroll() = _HasScroll;
  const factory MapState.loading() = _Loading;
  const factory MapState.success(MapModel address) = _Success;
  const factory MapState.error(String errorMessage) = _Error;
}
