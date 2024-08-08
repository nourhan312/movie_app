
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelpers {
  static const String movieBox = 'MoviesBox';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    await Hive.openBox<Movie>(movieBox);
    myBox = await openHiveBox("AuthBox");

  }

  static Box<Movie> get box => Hive.box<Movie>(movieBox);

  static Future<void> addMovie(Movie movie) async {
    await box.add(movie);
  }

  static List<Movie> getMovies() {
    return box.values.toList();
  }

  static Future<void> removeMovie(int movieId) async {
    final movie = box.values.firstWhere((element) => element.id == movieId);
    await movie.delete();
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