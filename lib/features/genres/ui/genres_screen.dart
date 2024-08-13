import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/genres/ui/category_card.dart';

class MovieGenres extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Action", "icon": "🔥"},
    {"name": "Comedy", "icon": "😂"},
    {"name": "Drama", "icon": "🎭"},
    {"name": "Horror", "icon": "👻"},
    {"name": "Romance", "icon": "❤️"},
    {"name": "Sci-Fi", "icon": "🚀"},
    {"name": "Thriller", "icon": "🔪"},
    {"name": "Documentary", "icon": "🎥"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryName: categories[index]["name"]!,
              categoryIcon: categories[index]["icon"]!,
            );
          },
        ),
      ),
    );
  }
}

