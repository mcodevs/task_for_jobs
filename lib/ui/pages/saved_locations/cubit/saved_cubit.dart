import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

part 'saved_state.dart';
part 'saved_cubit.freezed.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(const SavedState.initial());

  void addSuccess(MapModel address) {
    emit(SavedState.success(address));
  }

  void addSuccessSaved(MapModel address) {
    emit(SavedState.successSaved(address));
  }
}
