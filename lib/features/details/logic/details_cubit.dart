import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/services/get_credits.dart';
import 'package:movie_app/features/details/data/models/video_lancher_model.dart';

import '../../../core/networking/services/get_movie_details.dart';
import '../../../core/networking/services/get_user_review.dart';
import '../../../core/networking/services/get_video.dart';
import '../data/models/details_model.dart';
import '../data/models/movie_credits.dart';
import '../data/models/review_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  List<Review>? reviewList;
  MovieDetails? details;
  MovieCredits? movieCredits;
  List<Results>? videoList;

  void getReviews({
    required int id,
  }) async {
    emit(ReviewLoading());
    try {
      reviewList = await GetUserReview.getReviews(id: id);
      emit(ReviewSuccess());
    } catch (e) {
      emit(ReviewError(e.toString()));
    }
  }

  void movieDetails({
    required int id,
  }) async {
    emit(DetailsLoading());
    try {
      details = await GetMovieDetails.getDetails(id: id);
      emit(DetailsSuccess());
    } catch (e) {
      emit(DetailsError(e.toString()));
    }
  }

  void getMovieCredits({
    required int id,
  }) async {
    emit(CreditLoading());
    try {
      movieCredits = await GetCredits.getCredits(movieId: id);
      emit(CreditSuccess());
    } catch (e) {
      emit(CreditError(e.toString()));
    }
  }

  void getVideo({required int id}) async {
    emit((VideoLuncherLoading()));
    try {
      videoList = await GetVideo.getVideo(id: id);
      emit(VideoLuncherSuccess());
    } catch (e) {
      emit(VideoLuncherError(e.toString()));
    }
  }
}
