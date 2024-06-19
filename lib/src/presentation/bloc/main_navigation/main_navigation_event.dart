part of 'main_navigation_bloc.dart';

sealed class MainNavigationEvent extends Equatable {
  const MainNavigationEvent();
}

class MainNavigatorUserEvent extends MainNavigationEvent{
  final int index;
  const MainNavigatorUserEvent({required this.index});
  @override
  List<Object?> get props => [index];
}
