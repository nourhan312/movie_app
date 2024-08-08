import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_screen/logic/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home_screen/logic/trending_movie_cubit/trending_cubit.dart';
import 'carousel_slider_section.dart';
import 'header_section.dart';
import 'movie_tab.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(),
        BlocProvider(
            create: (context) => TrendingCubit()..getTrendingMovies(),
            child: const CarouselSliderSection()),
        BlocProvider(
            create: (context) => CategoriesCubit()..getNowPlayingMovies()..getPopularMovies()..getTopRatedMovies()..getUpcomingMovies(),
            child: const MovieTabs(),)
      ],
    );
  }
}


