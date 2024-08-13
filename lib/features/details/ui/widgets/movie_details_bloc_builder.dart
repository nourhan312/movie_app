
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie_arg.dart';
import '../../logic/details_cubit.dart';
import 'movie_details_body.dart';

class MovieDetailsBlocBuilder extends StatelessWidget {
  const MovieDetailsBlocBuilder({
    super.key, required this.movies,
  });

  final MovieArg movies ;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading ||
            state is CreditLoading ||
            state is ReviewLoading ||
            state is VideoLuncherLoading ||
            state is SimilarLoading ||
            state is RecommendationsLoading ||
            context.read<DetailsCubit>().details == null ||
            context.read<DetailsCubit>().movieCredits == null ||
            context.read<DetailsCubit>().reviewList == null ||
            context.read<DetailsCubit>().similarList == null ||
            context.read<DetailsCubit>().recommendList == null ||
            context.read<DetailsCubit>().videoList == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DetailsError ||
            state is CreditError ||
            state is ReviewError ||
            state is VideoLuncherError) {
          return const Center(
            child: Text(
              'Error: ',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return MovieDetailsBody(
            movies: movies,
          );
        }
      },
    );
  }
}
