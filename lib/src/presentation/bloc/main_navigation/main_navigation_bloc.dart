import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_navigation_event.dart';
part 'main_navigation_state.dart';

class MainNavigationBloc extends Bloc<MainNavigationEvent, MainNavigationState> {
  MainNavigationBloc() : super(MainNavigationInitial()) {
    on<MainNavigatorUserEvent>((event, emit) {
      emit(MainNavigationSuccess(index:event.index));
    });
  }
}
