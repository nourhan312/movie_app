import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import '../../../../core/theming/text_style.dart';
import '../../data/models/details_model.dart';
import 'genres_section.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(8),
            GenresSection(genres: details.genres),
            verticalSpace(16),
            _buildInfoRow(
              title: "Release Date:",
              value: details.releaseDate.toString().substring(0, 10),
              icon: Icons.calendar_today,
            ),
            verticalSpace(16),
            _buildInfoRow(
              title: "Run Time:",
              value: "${details.runtime} min",
              icon: Icons.access_time,
            ),
            verticalSpace(16),
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            verticalSpace(10),
            Text(
              details.overview.toString(),
              style: TextStyle(color: Colors.white.withOpacity(.7)),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      {required String title, required String value, required IconData icon}) {
    return Card(
      color: Colors.black54,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            horizontalSpace(8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: TextStyles.font16Medium,
            ),
          ],
        ),
      ),
    );
  }
}
