part of 'search_manument_bloc.dart';

sealed class SearchManumentEvent extends Equatable {
  const SearchManumentEvent();
}

class SearchManumentUserEvent extends SearchManumentEvent{
  final String title;
  const SearchManumentUserEvent({required this.title});
  @override
  List<Object?> get props => [];
}


