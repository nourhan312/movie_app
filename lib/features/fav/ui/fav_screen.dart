import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theming/app_colors.dart';
import 'package:movie_app/features/fav/provider/fav_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();

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
      body: ListView.builder(
        itemCount: favoritesProvider.favorites.length,
        itemBuilder: (context, index) {
          final favorite = favoritesProvider.favorites[index];
          return Container(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${favorite.posterPath}',
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
          );
        },
      ),
    );
  }
}
