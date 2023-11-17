class MovieList {
  final int id;

  final String posterPath;
  final String title;

  MovieList({
    required this.id,
    required this.posterPath,
    required this.title,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return MovieList(
      id: json['id'] ?? 0,
      posterPath: json['poster_path'] ?? "",
      title: json['title'] ?? "",
    );
  }
}
