
import '../../../genres/data/models/movies_depends_on_genre_id.dart';
import '../../../home_screen/data/models/movie_model.dart';

class MovieArg{
  final Movie ? movie;
  final GenresMovie ? movieGenres;
  MovieArg(this.movie , this.movieGenres);
}