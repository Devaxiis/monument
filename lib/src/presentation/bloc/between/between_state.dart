part of 'between_bloc.dart';

sealed class BetweenState extends Equatable {
  const BetweenState();
}

final class BetweenInitial extends BetweenState {
  @override
  List<Object> get props => [];
}
final class BetweenLoading extends BetweenState {
  @override
  List<Object> get props => [];
}
final class BetweenSuccess extends BetweenState {
  final List<AllManumentDataDataList?> data;
  const BetweenSuccess({required this.data});
  @override
  List<Object> get props => [data];
}
final class BetweenFailure extends BetweenState {
  final String message;
  const BetweenFailure({required this.message});
  @override
  List<Object> get props => [message];
}
