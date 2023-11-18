import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/AppBar/AppBarBloc.dart';
import 'package:tentwenty/Bloc/AppBar/AppBarEvents.dart';
import 'package:tentwenty/Bloc/AppBar/AppBarStates.dart';
import 'package:tentwenty/Widgets/SearchBar.dart';
class TopAppBar extends StatelessWidget {
  final index;
  const TopAppBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc,AppBarStates>(
      builder:(context, state) => state is AppBarInitialState || state is AppBarSearchInActiveState? AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(index==0?"Dashboard":index==1?"Watch":index==2?"Media Library":"More", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){
              BlocProvider.of<AppBarBloc>(context).add(SearchButtonClickEvent());
            }, icon: const Icon(Icons.search)),
          )
        ],
        elevation: 1,shadowColor: Colors.black,
      ):const MovieSearchBar(),
    );
  }
}
