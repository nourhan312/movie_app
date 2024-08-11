import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/ui/widgets/custom__icon_button.dart';

import '../fav/logic/fav_cubit.dart';
import '../fav/logic/fav_state.dart';
import '../home_screen/data/models/movie_model.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key, required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (BuildContext context, state) {
        if (state is FavoritesLoaded) {
          final isFavorite = state.favorites.any((fav) => fav.id == movie.id);
          return
            Positioned(
              top: 40.h,
              right: 20.w,
              child: CustomIconButton(
                icon: CupertinoIcons.heart ,
                iconColor: isFavorite ? Colors.red : Colors.white,
                onTap: () {
                  context.read<FavoritesCubit>().toggleFavorite(movie);
                },
                color: Colors.black87.withOpacity(0.8),
              ),
            );
        }
        return const CircularProgressIndicator();
      },


    );
  }
}
