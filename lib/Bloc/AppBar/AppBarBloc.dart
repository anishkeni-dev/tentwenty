
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:tentwenty/Service/repository.dart';

import 'AppBarEvents.dart';
import 'AppBarStates.dart';

class AppBarBloc extends Bloc<AppBarEvents,AppBarStates>{
  Repository repo = Repository();
  AppBarBloc(): super(AppBarInitialState()){
    on<SearchButtonClickEvent>((event, emit) {
        emit(AppBarSearchActiveState());
    });
    on<StartSearchEvent>((event, emit)async {

      if(event.searchInput==""){
        emit(AppBarSearchActiveState());
      }
      else {
        emit(SearchResultsLoadedState([]));
        List data = await repo.getSearchData(event.searchInput);
        print(data.toString());
        if (data.isNotEmpty) {
          emit(SearchResultsLoadedState(data));
        }
      }
    });
    on<AppBarSearchCloseEvent>((event, emit) {
      emit(AppBarSearchInActiveState());
    });

  }
}