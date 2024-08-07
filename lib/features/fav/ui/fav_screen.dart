import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/app_colors.dart';

import '../../home_screen/ui/widgets/movie_category.dart';
import '../logic/fav_cubit.dart';
import '../logic/fav_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsManager.bodyApp,
      appBar: AppBar(
        backgroundColor: ColorsManager.bodyApp,
        leading: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
        title: const Text('Favorites',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body:BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final movies = state.favorites;
                  return MovieCategory(movies:movies,);
                },
              ),
            );
          }
          return const CircularProgressIndicator(color: Colors.grey,);
        },
      ),
    );
  }
}
