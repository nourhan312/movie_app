
import 'package:hive/hive.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelpers {
  static const String movieBox = 'MoviesBox';
  static var box = Hive.box<Movie>(movieBox);

  static List<Movie> noteList = [];

  // Add a note
  static Future<void> addMovie(Movie movie) async{
    await box.add(movie);
    noteList.add(movie);
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