import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/genres/logic/genres_cubit.dart';
import 'package:movie_app/features/genres/ui/movie_category.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_style.dart';

class MovieGenresList extends StatelessWidget {
  const MovieGenresList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit= context.read<GenresCubit>();
    return Scaffold(
      body:  Container(
        color: ColorsManager.bodyApp,
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Movies',
                  style: TextStyles.font24SemiBoldWhite,
                ),
              ),
              verticalSpace(15),
              Expanded(
                child: BlocBuilder<GenresCubit, GenresState>(
                  builder: (context, state) {
                    if (state is GetMoviesGenresLoading ||
                    cubit.moviesDependsOnGenreId== null
                    ) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetMoviesGenresError) {
                      return const Center(
                        child: Text(
                          'Error: ',
                          style: TextStyle(color: Colors.red),
                        )
                      );
                    }
                    return  MovieGernresCategory(movies: cubit.moviesDependsOnGenreId!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
