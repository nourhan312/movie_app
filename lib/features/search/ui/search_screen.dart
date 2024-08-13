import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'package:movie_app/features/search/ui/widgets/custome_text_field.dart';
import 'package:movie_app/features/search/ui/widgets/states_check.dart';

import '../../../core/theming/app_colors.dart';
import '../logic/cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: ColorsManager.bodyApp,
      child: BlocProvider(
        create: (context) => SearchCubit(SearchMovie()),
        child: const Column(
          children: [
            CustomTextFormField(),
            StatesCheck(),
          ],
        ),
      ),
    );
  }
}
