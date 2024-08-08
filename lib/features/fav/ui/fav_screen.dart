import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/text_style.dart';

import '../../../core/theming/app_colors.dart';
import '../../home_screen/ui/widgets/movie_category.dart';
import '../logic/fav_cubit.dart';
import '../logic/fav_state.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    context.read<FavoritesCubit>().loadFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            final movies = state.favorites;
            return movies.isEmpty
                ? Center(
                    child: Text("No Favourite Movie.......",style: TextStyles.font18SemiBoldWhite,),
                  )
                : MovieCategory(
                    movies: movies,
                  );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
