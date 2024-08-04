import 'package:hive/hive.dart';

part 'movie_model.g.dart';


class MoviesList {
  final List<Movie> result;

  MoviesList({
    required this.result,
  });

  factory MoviesList.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    return MoviesList(result: list.map((e) => Movie.fromJson(e)).toList());
  }
}


@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final double voteAverage;

  @HiveField(2)
  final String originalLanguage;

  @HiveField(3)
  final String originalTitle;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final String posterPath;

  @HiveField(6)
  final String backdropPath;

  @HiveField(7)
  final String releaseDate;

  @HiveField(8)
  final List<int> genreIds;

  Movie({
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vote_average': voteAverage,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'genre_ids': genreIds,
    };
  }
}