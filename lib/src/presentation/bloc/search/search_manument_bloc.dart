import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_data_get_model.dart';
import 'package:monumentuz/src/injector.dart';

import '../../../domain/models/remote_models.dart/all_monument_list_data_model.dart';

part 'search_manument_event.dart';
part 'search_manument_state.dart';

class SearchManumentBloc extends Bloc<SearchManumentEvent, SearchManumentState> {
  SearchManumentBloc() : super(SearchManumentInitial()) {
    on<SearchManumentUserEvent>(_searchData);
  }
  
  void _searchData(SearchManumentUserEvent event ,Emitter emit)async{
    
    emit(SearchManumentLoading());
    
    final response = await repository.searchMonument(event.title);
    if(response!.success){
      emit(SearchManumentSuccess(data: response.data));
    }else{
      emit(SearchManumentFailure());
    }
      emit(SearchManumentFailure());

  }
}
