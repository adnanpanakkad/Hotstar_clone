class TvSeries {
  final dynamic posterPathTv;
  final dynamic backdropPath;
  final String title;
  final String overview;

  TvSeries({
    required this.title,
    required this.overview,
    required this.posterPathTv,
    required this.backdropPath,
  });
  factory TvSeries.fromJson(Map<String, dynamic> json) {
    return TvSeries(
      posterPathTv: json["poster_path"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      title: json["original_name"],  
    );
  }
}