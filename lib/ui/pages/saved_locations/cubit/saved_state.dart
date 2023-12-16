part of 'saved_cubit.dart';

@freezed
class SavedState with _$SavedState {
  const factory SavedState.initial() = _Initial;
  const factory SavedState.success(MapModel address) = _Success;
  const factory SavedState.successSaved(MapModel address) = _SuccessSaved;
}
