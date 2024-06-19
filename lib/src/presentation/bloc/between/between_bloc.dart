import 'package:monumentuz/library.dart';

part 'between_event.dart';
part 'between_state.dart';

class BetweenBloc extends Bloc<BetweenEvent, BetweenState> {
  BetweenBloc() : super(BetweenInitial()) {
    on<BetweenUserGetEvent>((event, emit)async {
      emit(BetweenLoading());
      final reponse = await repository.betweenManument(event.yearOne, event.yearTwo);
      if(reponse!.success){
        emit(BetweenSuccess(data: reponse.data));
      }else{
        emit(const BetweenFailure(message: "error"));
      }
    });
  }
}
