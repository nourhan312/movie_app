import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/features/home_screen/logic/categories_cubit/categories_cubit.dart';
import 'package:movie_app/features/home_screen/logic/trending_movie_cubit/trending_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import 'carousel_slider_section.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20),
          child: Row(
            children: [
              Text(
                "What do you want to watch?",
                style: TextStyles.font18SemiBoldWhite,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pushNamed(Routes.searchScreen);
                },
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
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

