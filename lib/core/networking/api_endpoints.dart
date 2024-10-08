class ApiEndPoints {
  static const String login = "login";
  static const String signup = "register";
  static const popularMovies = '/movie/popular';
  static const ratedMovies = '/movie/top_rated';
  static const upcomingMovies = '/movie/upcoming';
  static const nowPlayingMovies = '/movie/now_playing';
  static const genresList = '/genre/movie/list';
  static String movieSimilar(int movieId) => '/movie/$movieId/similar';
  static String search(String query) => '/search/movie?query=$query';
  static String movieDetails(int movieId) => '/movie/$movieId';
  static String movieReviews(int movieId) => '/movie/$movieId/reviews';
  static String movieImage(int movieId) => '/movie/$movieId/reviews';
  static String getMovieDependsOnGenreId(int genreId) => '/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$genreId';
  static String movieCredits({
    required int movieId,
  }) =>
      '/movie/$movieId/credits';

  static String movieTrending() => '/trending/movie/day';

  static String movieVideo(int movieId) => '/movie/$movieId/videos';
  static String movieRecommendations(int movieId) => '/movie/$movieId/recommendations';
}
