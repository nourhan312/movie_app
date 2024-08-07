import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/services/search_movie.dart';
import 'package:movie_app/core/theming/app_colors.dart';

import '../logic/cubit/search_cubit.dart';
import '../widgets/custome_text_field.dart';
import '../widgets/states_check.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchMovie()),
      child: Scaffold(
        backgroundColor: ColorsManager.bodyApp,
        appBar: AppBar(
          backgroundColor: ColorsManager.bodyApp,
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.details,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: const Column(
          children: [
            CustomTextFormField(),
            StatesCheck(),
          ],
        ),
      ),
    );
  }
}
