
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelpers {
  static const String movieBox = 'MoviesBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    await Hive.openBox<Movie>(movieBox);
  }

  static Box<Movie> get box => Hive.box<Movie>(movieBox);

  // Add a movie
  static Future<void> addMovie(Movie movie) async {
    await box.add(movie);
  }

  // Get all movies
  static List<Movie> getMovies() {
    return box.values.toList();
  }

  // Remove a movie by id
  static Future<void> removeMovie(int movieId) async {
    final movie = box.values.firstWhere((element) => element.id == movieId);
    await movie.delete();
  }



  static Box? myBox;


  static Future<Box> openHiveBox(String boxName) async
  {
//كدا انا بقوله لو هو مفتوح خد ال path وروح اعمله init
    if(!Hive.isBoxOpen(boxName))
    {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    //لو لا يبقي روح افتحه
    return await Hive.openBox(boxName);

  }

}