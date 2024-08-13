import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/helper/extentions.dart';
import '../../../../core/routing/routes.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final int id;

  const CategoryCard({super.key, required this.categoryName, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () {
         context.pushNamed(Routes.movieCategory, arguments: id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent.withOpacity(0.6),
              Colors.purpleAccent.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                categoryName,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}