import 'package:flutter/material.dart';

class MovieCategory extends StatelessWidget {
  final List<Map<String, String>> movies;

  MovieCategory({required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 120,
              child: Image.asset(movie['image']!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8.0),
            Text(
              movie['title']!,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}