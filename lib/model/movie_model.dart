class Movie {
  final String posterPath;
  final String title;
  final String backdropPath;
  final String originalTitle;
  final String overview;
  final String releaseDate; 

  Movie(
      {required this.posterPath,
      required this.title,
      required this.backdropPath,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json["poster_path"],
      backdropPath: json["backdrop_path"],
      title: json["title"], 
      originalTitle: json["original_title"],
      overview: json["overview"],
      releaseDate: json["release_date"],
    );
  }

  static fromjson(movie) {}
}