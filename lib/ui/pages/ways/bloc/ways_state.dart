part of 'ways_bloc.dart';

@freezed
class WaysState with _$WaysState {
  const factory WaysState.initial() = _Initial;

  const factory WaysState.loading(List<MapObject> objects) = _Loading;

  const factory WaysState.success(List<MapObject> objects) = _Success;

  const factory WaysState.error(String errorMessage) = _Error;
}
