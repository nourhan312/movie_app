class Movie {
  final List<ResultModel> result;

  Movie({
    required this.result,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    return Movie(result: list.map((e) => ResultModel.fromJson(e)).toList());
  }
}

class ResultModel {
  final int id;
  final double voteAverage;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final List<int> genreIds;

  ResultModel({
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.voteAverage,
    required this.backdropPath,
    required this.genreIds,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      id: json['id'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
}
