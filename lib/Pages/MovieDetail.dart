import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tentwenty/Service/repository.dart';
import 'package:tentwenty/Widgets/Common/buttons.dart';

import '../Theme/theme.dart';

class MovieDetail extends StatefulWidget {
  final movieId;
  const MovieDetail({
    super.key,
    this.movieId,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Future<dynamic> futureMovieData = Future.value();
  String formattedDate = "";
  Repository repo = Repository();

  fetchDetails() async {
    var data = await repo.getMovieDetails(widget.movieId);
    setState(() {
      futureMovieData = Future.value(data);
    });
    convertReleaseDate(data.releaseDate);
  }
  convertReleaseDate(date){

    // Parse the input date string
    DateTime parsedDate = DateTime.parse(date);

    // Format the date into 'MMMM dd, yyyy' format
     formattedDate = DateFormat('MMMM dd, yyyy').format(parsedDate);

  }

  MaterialStateProperty<Color?>? materialColor = MaterialStateColor.resolveWith((states) => Colors.primaries[Random().nextInt(Colors.primaries.length)]);

  @override
  void initState() {
    fetchDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppBar(
              title: Text("Watch", style: TextStyle(color: AppTheme().primaryTextColor),),
              leading:  IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined, color: AppTheme().primaryTextColor), onPressed: () { Navigator.pop(context); }, ),
              forceMaterialTransparency: true),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          builder:(context, snapshot) => snapshot.hasData?  Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 500,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original' +
                                  snapshot.data!.posterPath),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent, Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.2, 0.4, 1],
                      ),
                    ),
                    child: const SizedBox()),
                Container(
                  margin: const EdgeInsets.only(top: 280),
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.32,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "in Theatres "+ formattedDate,
                          style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w800,
                            color: AppTheme().primaryTextColor,
                          ),
                        ),
                      ),
                      Container(margin: const EdgeInsets.all(10.0),width:250,height:50,child: const PrimaryElevatedButton(buttonText: "Get Tickets")),
                      Container(margin: const EdgeInsets.all(10.0),width:250,height:50, child:SecondaryElevatedButton(buttonText: "Watch Trailer"))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0,left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Genres",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                      transform: Matrix4.translationValues(0, -60, 0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Chip(color: materialColor ,label: Text(snapshot.data!.genres[index].name,style: const TextStyle(color: Colors.white),)),
                                    ),
                                itemCount: snapshot.data!.genres.length,
                              ))
                        ],
                      )),
                  Container(
                    transform: Matrix4.translationValues(0, -80, 0),
                    child: const Text("Overview",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, -70, 0),
                    margin: const EdgeInsets.only(right: 30,),
                    child: Text(
                      snapshot.data!.overview,style: TextStyle(color: AppTheme().tertiaryTextColor),),
                  )
                ],
              ),
            )
          ]):const Center(child: CircularProgressIndicator()), future:futureMovieData ,
        ),
      ),
    );
  }
}

