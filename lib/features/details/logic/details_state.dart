part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class ReviewLoading extends DetailsState {}

final class ReviewSuccess extends DetailsState {}

final class ReviewError extends DetailsState {
  final String message;
  ReviewError(this.message);
}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {}

final class DetailsError extends DetailsState {
  final String message;
  DetailsError(this.message);
}

final class CreditLoading extends DetailsState {}

final class CreditSuccess extends DetailsState {}

final class CreditError extends DetailsState {
  final String message;
  CreditError(this.message);
}
