import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Bloc/HomePageBloc/HomeBloc.dart';
import 'Pages/HomePage.dart';
import 'Pages/WatchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routes: {
        '/watch': (context) => const WatchPage(),
      },
      home:BlocProvider(
        create: (context)=> HomeBloc(),
        child: const HomePage(),
      ),
    );
  }
}
