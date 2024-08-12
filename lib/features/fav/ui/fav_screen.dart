import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/spacing.dart';
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
    return Container(
      color: ColorsManager.bodyApp,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Favorites',
              style: TextStyles.font24SemiBoldWhite,
            ),
          ),
          verticalSpace(15),
          Expanded(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
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
          ),
        ],
      ),
    );
  }
}
