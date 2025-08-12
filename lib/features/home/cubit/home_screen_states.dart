sealed class HomeScreenState {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial();
}

class ChangeTabState extends HomeScreenState {
  final int index;

  const ChangeTabState(this.index);
}
