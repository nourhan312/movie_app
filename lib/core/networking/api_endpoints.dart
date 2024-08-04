class ApiEndPoints {
  static const String login = "login";
  static const String signup = "register";
  static const popularMovies = '/movie/popular';
  static const ratedMovies = '/movie/top_rated';
  static const upcomingMovies = '/movie/upcoming';

  static const nowPlayingMovies = '/movie/now_playing';
  static String movieSimilar(int movieId) => '/movie/$movieId/similar';
  static String search(String query) => '/search/movie?query=$query';

  static String movieDetails(int movieId) => '/movie/$movieId';
  static String movieReviews(int movieId) => '/movie/$movieId/reviews';
}
