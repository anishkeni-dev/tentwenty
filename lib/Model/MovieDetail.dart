class MovieDetail {
  List<Genre> genres;
  int id;
  String posterPath;
  String releaseDate;
  String tagline;
  String title;
  String overview;
  MovieDetail({
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.tagline,
    required this.title,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      genres: List<Genre>.from(
          json['genres']?.map((x) => Genre.fromJson(x)) ?? const []),
      id: json['id'] ?? 0,
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',

      releaseDate: json['release_date'] ?? '',

      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      );
  }
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

