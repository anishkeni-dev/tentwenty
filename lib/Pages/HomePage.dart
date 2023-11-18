import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeBloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeStates.dart';
import 'package:tentwenty/Pages/WatchPage.dart';
import 'package:tentwenty/Service/api.dart';
import 'package:tentwenty/Service/repository.dart';
import 'package:tentwenty/Widgets/Common/bottomNavBar.dart';
import 'package:tentwenty/Widgets/TopAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Dashboard',
    ),
    WatchPage(),
    Text(
      "Media Library",
    ),
    Text(
      "More",
    )
  ];
  Repository repo = Repository();
  @override


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:(context) =>  BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromRGBO(246, 246, 250,1),
          appBar: PreferredSize(preferredSize: const Size.fromHeight(60),child: TopAppBar(index: state is PageChangeState?state.index:0,)),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state is PageInitialState
                    ? Center(child: _widgetOptions.elementAt(0))
                    : state is PageChangeState
                        ?  Center(child:_widgetOptions.elementAt(state.index))
                        : const CircularProgressIndicator()
              ]),
          bottomNavigationBar: const BottomNavBar(),
        );
      }),
    );
  }
}
