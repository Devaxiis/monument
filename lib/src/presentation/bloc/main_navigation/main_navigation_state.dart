part of 'main_navigation_bloc.dart';

sealed class MainNavigationState extends Equatable {
  const MainNavigationState();
}

final class MainNavigationInitial extends MainNavigationState {
  @override
  List<Object> get props => [];
}

class MainNavigationSuccess extends MainNavigationState{
  final int index;
  const MainNavigationSuccess({required this.index});
  @override
  List<Object?> get props => [index];
}
