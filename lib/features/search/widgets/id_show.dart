import 'package:flutter/material.dart';

class IdShow extends StatelessWidget {
  final int movieId;
  const IdShow({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Movie ID: $movieId',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
