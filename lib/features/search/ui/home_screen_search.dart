import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/search/ui/search_screen.dart';

import '../logic/cubit/search_cubit.dart';

class HomeScreenSearch extends StatelessWidget {
  const HomeScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(SearchMovie()),
          child: const SearchScreen(),
        ),
      ),
    );
  }
}
