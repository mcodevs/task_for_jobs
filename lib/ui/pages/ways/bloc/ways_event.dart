part of 'ways_bloc.dart';

@freezed
class WaysEvent with _$WaysEvent {
  const factory WaysEvent.getDirections() = _GetDirections;

  const factory WaysEvent.clear() = _Clear;
}
