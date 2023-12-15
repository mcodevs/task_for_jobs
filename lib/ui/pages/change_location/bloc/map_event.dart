part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.started() = _Started;
  const factory MapEvent.changeByMap(Point address) = _ChangeByMap;
  const factory MapEvent.changeByAddress(String address) = _ChangeByAddress;
  const factory MapEvent.scrollStarted() = _ScrollStarted;
}
