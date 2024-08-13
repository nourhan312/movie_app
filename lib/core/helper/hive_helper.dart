
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/genres/data/models/movies_depends_on_genre_id.dart';

class HiveHelpers {
  static const String movieBox = 'MoviesBox';
  static const String genresMovieBox = 'GenresMoviesBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(GenresMovieAdapter());
    await Hive.openBox<Movie>(movieBox);
    await Hive.openBox<GenresMovie>(genresMovieBox);
    myBox = await openHiveBox("AuthBox");
  }

  static Box<Movie> get movieBoxInstance => Hive.box<Movie>(movieBox);
  static Box<GenresMovie> get genresMovieBoxInstance => Hive.box<GenresMovie>(genresMovieBox);

  static Future<void> addMovie(Movie movie) async {
    await movieBoxInstance.add(movie);
  }

  static Future<void> addGenresMovie(GenresMovie genresMovie) async {
    await genresMovieBoxInstance.add(genresMovie);
  }

  static List<Movie> getMovies() {
    return movieBoxInstance.values.toList();
  }

  static List<GenresMovie> getGenresMovies() {
    return genresMovieBoxInstance.values.toList();
  }

  static Future<void> removeMovie(int movieId) async {
    final movie = movieBoxInstance.values.firstWhere((element) => element.id == movieId);
    await movie.delete();
  }

  static Future<void> removeGenresMovie(int genresMovieId) async {
    final genresMovie = genresMovieBoxInstance.values.firstWhere((element) => element.id == genresMovieId);
    await genresMovie.delete();
  }


  static Box? myBox;


  static Future<Box> openHiveBox(String boxName) async
  {
    if(!Hive.isBoxOpen(boxName))
    {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    //لو لا يبقي روح افتحه
    return await Hive.openBox(boxName);
  }

}