import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  static const String from = "Qayerdan";
  static const String to = "Qayerga";

  void changeFirst(MapModel newValue) {
    emit(state.copyWith(first: newValue));
  }

  void changeSecond(MapModel newValue) {
    emit(state.copyWith(second: newValue));
  }
}
