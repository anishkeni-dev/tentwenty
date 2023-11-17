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

  @override
  void initState() {
    fetchDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text("Watch"),
          leading: const Icon(Icons.arrow_back_ios_new_outlined),
          forceMaterialTransparency: true),
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
                        colors: [
                          Colors.transparent,
                          Colors.black, // Adjust opacity as needed
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 1],
                      ),
                    ),
                    child: const SizedBox()),
                Container(
                  margin: const EdgeInsets.only(top: 280),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.92,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "in Theatres "+ formattedDate,
                        style: TextStyle(
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                          color: AppTheme().primaryTextColor,
                        ),
                      ),
                      const PrimaryElevatedButton(buttonText: "Get Tickets"),
                      const SecondaryElevatedButton(buttonText: "Watch Trailer")
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Genres",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    Chip(label: Text("Action")),
                                itemCount: 1,
                              ))
                        ],
                      )),
                  const Text("Overview",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 10,),
                    child: Text(
                      snapshot.data!.overview,style: TextStyle(color: AppTheme().tertiaryTextColor),),
                  )
                ],
              ),
            )
          ]):Center(child: CircularProgressIndicator()), future:futureMovieData ,
        ),
      ),
    );
  }
}
