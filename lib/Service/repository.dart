import 'dart:convert';

import 'package:tentwenty/Model/MovieList.dart';
import 'package:tentwenty/Service/api.dart';

import '../Model/MovieDetail.dart';

class Repository{
  getUpcomingMovies()async{
    const endPoint = "/movie/upcoming";
    var jsonData = await fetchData(endPoint);
    Map<String, dynamic> data = json.decode(jsonData);
    List<MovieList> movieList = [];

    for (var item in data['results']) {
      if (item is Map<String, dynamic>) {
        movieList.add(MovieList.fromJson(item));
      }
    }

    return movieList;
  }
  getMovieDetails(movieId)async{
    int id = movieId;
    String endPoint = "/movie/$id";
    var jsonData = await fetchData(endPoint);
    var data = MovieDetail.fromJson(jsonDecode(jsonData) as Map<String, dynamic>);

    return data;
  }
  // getGenres(movieData)async{
  //   // print(data[0].id.toString());
  //   // print(data[1].id.toString());
  //
  //   const endPoint = "/genre/movie/list";
  //   var jsonData = await fetchData(endPoint);
  //   Map<String, dynamic> data = json.decode(jsonData);
  //
  //   List<Genre> genreList = [];
  //   for (var i = 0; i<data['genres'].length;i++) {
  //     if (data['genres'][i] is Map<String, dynamic>) {
  //       genreList.add(Genre.fromJson(data['genres'][i]));
  //     }
  //   }
  //   for(var i = 0; i< movieData.length;i++){
  //     for(var  j = 0; j<genreList.length;j++) {
  //       if (movieData[i].id == genreList[j].id) {
  //
  //       }
  //     }
  //   }
  //
  // }
}