import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty/Bloc/HomePageBloc/HomeEvents.dart';

import '../../Bloc/HomePageBloc/HomeBloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState
    extends State<BottomNavBar> {
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    BlocProvider.of<HomeBloc>(context).add(
        BottomNavClickEvent(_selectedIndex)
    );
  }

  @override
  Widget build(BuildContext context) {
    return
       BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
    );
  }
}
