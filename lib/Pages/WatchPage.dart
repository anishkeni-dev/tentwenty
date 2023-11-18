import 'package:flutter/material.dart';
import 'package:tentwenty/Service/repository.dart';
import 'package:tentwenty/Widgets/Common/movieCard.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  Future<dynamic> futureMovieList = Future.value();

  Repository repo = Repository();

  getMovieList() async {
    var data = await repo.getUpcomingMovies();
    setState(() {
      futureMovieList = Future.value(data);
    });
  }

  @override
  void initState() {
     getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureMovieList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.aspectRatio < 1.0
                ? MediaQuery.of(context).size.height * 0.84
                : MediaQuery.of(context).size.height * 0.63,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    data: snapshot.data,
                    index: index,
                  );
                }),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
