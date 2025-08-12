import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_screen_states.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(const HomeScreenInitial());

  int currentIndex = 0;

  void changeTab(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeTabState(currentIndex));
    }
  }
}
