import 'package:flutter/material.dart';
import 'carousel_slider_section.dart';
import 'header_section.dart';
import 'movie_tab.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff242A32),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          CarouselSliderSection(),
          MovieTabs()
        ],
      ),
    );
  }
}
