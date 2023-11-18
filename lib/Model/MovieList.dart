import 'MovieDetail.dart';

class MovieList {
  final int id;
  List<Genre> genres;
  final String posterPath;
  final String title;

  MovieList({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.genres,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return MovieList(
      genres: List<Genre>.from(
          json['genres']?.map((x) => Genre.fromJson(x)) ?? const []),
      id: json['id'] ?? 0,
      posterPath: json['poster_path'] ?? "",
      title: json['title'] ?? "",
    );
  }
}
