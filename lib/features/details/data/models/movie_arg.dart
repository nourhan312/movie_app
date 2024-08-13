import 'package:movie_app/features/genres/ui/genres_screen.dart';

import '../../../genres/data/models/movies_depends_on_genre_id.dart';
import '../../../home_screen/data/models/movie_model.dart';

class MovieArg{
  final Movie ? movie;
  final GenresMovie ? movieGenres;
  final bool isMovieGenres ;
  MovieArg(this.isMovieGenres,   this.movie , this.movieGenres);
}