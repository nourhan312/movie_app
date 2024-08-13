import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/genres/logic/genres_cubit.dart';
import 'package:movie_app/features/genres/ui/widget/movies_genre_grid_view.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_style.dart';
import '../../details/ui/widgets/custom__icon_button.dart';

class MoviesDependsOnGenre extends StatelessWidget {
  const MoviesDependsOnGenre({super.key});

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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomIconButton(
                    icon: CupertinoIcons.back,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: Colors.transparent
                  ),
                  horizontalSpace(100),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Movies',
                      style: TextStyles.font24SemiBoldWhite,
                    ),
                  ),
                ],
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
                    return MovieGenresGridView(movies: cubit.moviesDependsOnGenreId!);
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
