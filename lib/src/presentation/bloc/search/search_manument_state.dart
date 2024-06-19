part of 'search_manument_bloc.dart';

sealed class SearchManumentState extends Equatable {
  const SearchManumentState();
}

final class SearchManumentInitial extends SearchManumentState {
  @override
  List<Object> get props => [];
}
final class SearchManumentLoading extends SearchManumentState {
  @override
  List<Object> get props => [];
}

final class SearchManumentSuccess extends SearchManumentState {
  final SearchDataModel data;
  const SearchManumentSuccess({required this.data});
  @override
  List<Object> get props => [data];
}
final class SearchManumentFailure extends SearchManumentState {
  @override
  List<Object> get props => [];
}
