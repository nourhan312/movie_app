import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({
    super.key,
    required this.genres,
  });

  final List genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            "Genres:",
            style:  TextStyles.font18Bold
                .copyWith(color: Colors.white),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: _buildGenreChip(genres[index].name.toString()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreChip(String genreName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [

            Color(0xff343A40), // Dark grey
            Color(0xff495057), // Slightly lighter grey
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          genreName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
