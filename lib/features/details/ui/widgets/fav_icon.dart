import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';

class FavIcon extends StatefulWidget {
  final Movie? movie;
  const FavIcon({Key? key, this.movie}) : super(key: key);

  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  Color iconColor = Colors.white;

  void _toggleIconColor() {
    setState(() {
      iconColor = iconColor == Colors.red ? Colors.white : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite, color: iconColor),
      onPressed: _toggleIconColor,
    );
  }
}
