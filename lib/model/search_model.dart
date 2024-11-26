class SearchMovie{
  final String posterPath;

  SearchMovie({required this.posterPath});

  factory SearchMovie.fromJson(Map<String, dynamic> json) {
    return SearchMovie(
      posterPath: json["poster_path"]??'',  
    );
  }
}