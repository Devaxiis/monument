part of 'between_bloc.dart';

sealed class BetweenEvent extends Equatable {
  const BetweenEvent();
}

class BetweenUserGetEvent extends BetweenEvent{
  final String yearOne;
  final String yearTwo;
  const BetweenUserGetEvent({required this.yearOne,required this.yearTwo});
  @override
  List<Object?> get props => [yearOne,yearTwo];
}

