part of 'details_cubit.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class ReviewLoading extends DetailsState {}

final class ReviewSuccess extends DetailsState {}

final class ReviewError extends DetailsState {
  final String message;
  ReviewError(this.message);
}
final class SimilarLoading extends DetailsState {}
final class SimilarSuccess extends DetailsState {}
final class SimilarError extends DetailsState {
  final String message;
  SimilarError(this.message);
}
final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {}

final class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}
final class RecommendationsLoading extends DetailsState {}
final class RecommendationsSuccess extends DetailsState {}
final class RecommendationsError extends DetailsState {
  final String message;
  RecommendationsError(this.message);
}
final class CreditLoading extends DetailsState {}

final class CreditSuccess extends DetailsState {}

final class CreditError extends DetailsState {
  final String message;
  CreditError(this.message);
}

final class VideoLuncherLoading extends DetailsState {}

final class VideoLuncherError extends DetailsState {
  final String message;
  VideoLuncherError(this.message);
}

final class VideoLuncherSuccess extends DetailsState {}
