import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/genres/ui/widget/category_card.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/text_style.dart';
import '../logic/genres_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GenresCubit>();
    return Container(
      color: ColorsManager.bodyApp,
      child: Column(
        children: [
          const Text(
            'Categories',
            style: TextStyles.font24SemiBoldWhite,
          ),
          verticalSpace(15),
          Expanded( // Use Expanded instead of Flexible
            child: BlocBuilder<GenresCubit, GenresState>(builder: (context, state) {
              if (state is GenresLoading || cubit.genres == null) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ));
              } else if (state is GenresError) {
                return const Center(
                  child: Text(
                    'Error: ',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: cubit.genres!.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categoryName: cubit.genres![index].name!,
                        id: cubit.genres![index].id!,
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}