import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_main_model.dart';
import 'package:monumentuz/src/injector.dart';

part 'all_manument_data_list_event.dart';
part 'all_manument_data_list_state.dart';

class AllManumentDataListBloc extends Bloc<AllManumentDataListEvent, AllManumentDataListState> {
  AllManumentDataListBloc() : super(AllManumentDataListInitial()) {
    on<AllManumentDataListUserEvent>(_allData);
  }

  void _allData(AllManumentDataListUserEvent event,Emitter emit)async{
    emit(AllManumentDataListLoading());
    final AllManumentMainDataList? response = await repository.getAllManuments();
    log("${response!.success}");
    if(response.success){
      emit(AllManumentDataListSuccess(data: response.data));
    }else{
      emit(const AllManumentDataListFailure(message: "error"));
    }
  }
}
