import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeBloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeStates.dart';
import 'package:tentwenty/Pages/WatchPage.dart';
import 'package:tentwenty/Service/api.dart';
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
      'Index 0: Home',
    ),
    WatchPage(),
    Text(
      'Index 2: School',
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    // fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 250,1),
        appBar: PreferredSize(preferredSize: Size.fromHeight(50),child: TopAppBar(index: state is PageChangeState?state.index:0,)),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is PageInitialState
                  ? Center(child: _widgetOptions.elementAt(0))
                  : state is PageChangeState
                      ? _widgetOptions.elementAt(state.index)
                      : const CircularProgressIndicator()
            ]),
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
