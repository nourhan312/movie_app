import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/genres/logic/genres_cubit.dart';
import 'package:movie_app/features/genres/ui/category_card.dart';

class MovieGenres extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit= context.read<GenresCubit>();
    return
      BlocBuilder<GenresCubit,GenresState>(
      builder: (context, state) {
        if (state is GenresLoading ||
        cubit.genres == null

        ) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GenresError) {
          return const Center(
            child: Text(
              'Error: ',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return  Scaffold(
            backgroundColor: const Color(0xff242A32),
            appBar: AppBar(
              title: Text(
                'Categories',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: cubit.genres!.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryName: cubit.genres![index].name!,
                       id : cubit.genres![index].id!,
                  );
                },
              ),
            ),
          );
        }
      }


    );
  }
}

