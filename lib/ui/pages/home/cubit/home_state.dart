part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    MapModel? first,
    MapModel? second,
  }) = _Initial;
}
