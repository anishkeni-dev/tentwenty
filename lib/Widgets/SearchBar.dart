import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/AppBar/AppBarBloc.dart';
import 'package:tentwenty/Bloc/AppBar/AppBarEvents.dart';
import 'package:tentwenty/Theme/theme.dart';

import '../Bloc/AppBar/AppBarStates.dart';

class MovieSearchBar extends StatelessWidget {
  const MovieSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SearchAnchor(
         viewElevation: null,
          builder: (BuildContext context, SearchController controller) {
            return Container(
              margin: EdgeInsets.only(top: 20,left: 10,right: 10),
              child: SearchBar(
                backgroundColor: MaterialStateProperty.resolveWith((states) => AppTheme().scaffoldBackground),
                elevation: MaterialStateProperty.resolveWith((states) => 0),
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),

                onChanged: (_) {

                    BlocProvider.of<AppBarBloc>(context).add(StartSearchEvent(controller.text));

                },
                leading: const Icon(Icons.search),
                trailing: [ IconButton(onPressed: () {
                  BlocProvider.of<AppBarBloc>(context).add(AppBarSearchCloseEvent());
                },icon: Icon(Icons.close_sharp),),]

              ),
            );
          }, suggestionsBuilder: (BuildContext context, SearchController controller) {  return List.empty();}, ),
    );
  }
}
