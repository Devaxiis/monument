part of 'all_manument_data_list_bloc.dart';

sealed class AllManumentDataListEvent extends Equatable {
  const AllManumentDataListEvent();
}

class AllManumentDataListUserEvent extends AllManumentDataListEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}
