import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zozy/Features/main/viewmodel/cubit/main_state.dart';


class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
