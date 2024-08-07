import 'package:flutter/material.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({
    super.key,
    required this.genres,
  });

  final List genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Genres:",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(width: 8),
        Flexible(
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      genres[index].name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
