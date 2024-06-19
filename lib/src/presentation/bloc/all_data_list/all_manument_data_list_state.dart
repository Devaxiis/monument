part of 'all_manument_data_list_bloc.dart';

sealed class AllManumentDataListState extends Equatable {
  const AllManumentDataListState();
}

final class AllManumentDataListInitial extends AllManumentDataListState {
  @override
  List<Object> get props => [];
}
final class AllManumentDataListLoading extends AllManumentDataListState {
  @override
  List<Object> get props => [];
}
final class AllManumentDataListSuccess extends AllManumentDataListState {
  final List<AllManumentDataDataList?> data;
  const AllManumentDataListSuccess({required this.data});
  @override
  List<Object> get props => [data];
}
final class AllManumentDataListFailure extends AllManumentDataListState {
  final String message;
  const AllManumentDataListFailure({required this.message});
  @override
  List<Object> get props => [message];
}
