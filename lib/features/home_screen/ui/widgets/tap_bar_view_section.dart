import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/logic/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home_screen/ui/widgets/shimmer_movie_category.dart';

import 'movie_category.dart';

class TabBarViewSection extends StatelessWidget {
  const TabBarViewSection({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if(state is PopularMoviesLoading ||
            state is UpcomingMoviesLoading ||
            state is TopRatedMoviesLoading ||
            state is NowPlayingMoviesLoading)
          {
            return Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  ShimmerMovieCategory(),
                  ShimmerMovieCategory(),
                  ShimmerMovieCategory(),
                  ShimmerMovieCategory(),
                ],
              ),
            );
          }
        return Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              MovieCategory(
                movies: context.read<CategoriesCubit>().popularMovies,genreMovies: null,
              ),
              MovieCategory(
                movies: context.read<CategoriesCubit>().topRatedMovies,genreMovies: null,
              ),
              MovieCategory(
                movies: context.read<CategoriesCubit>().upComingMovies,genreMovies: null,
              ),
              MovieCategory(
                movies: context.read<CategoriesCubit>().nowPlayingMovies,genreMovies: null,
              ),
            ],
          ),
        );
      },
    );
  }
}

