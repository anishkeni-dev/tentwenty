import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeEvents.dart';

import 'HomeStates.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates>{
  HomeBloc(): super(PageInitialState()){
    on<BottomNavClickEvent>((event, emit) {

      if(event.selectedIndex==0 ||event.selectedIndex==1 ||event.selectedIndex==2 ){
        emit(PageChangeState(event.selectedIndex));
      }

    });

  }
}