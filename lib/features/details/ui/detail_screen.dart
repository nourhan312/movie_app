import 'package:flutter/material.dart';
import 'package:movie_app/features/details/ui/widgets/cast_tab.dart';
import 'package:movie_app/features/details/ui/widgets/fav_icon.dart';
import 'package:movie_app/features/details/ui/widgets/movie_tab.dart';
import 'package:movie_app/features/details/ui/widgets/reviwes_tab.dart';
import 'package:movie_app/features/search/widgets/image_back.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const ImageBack(top: 0),
          title: const Text('Detail'),
          centerTitle: true,
          actions: const [FavIcon()],
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                  ),
                  child: Image.asset(
                    'assets/images/back_ground.png',
                    fit: BoxFit.cover,
                    width: 375,
                    height: 211,
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 29.0,
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/back_ground.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Spiderman No Way Home',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const TabBar(
              tabs: [
                Tab(text: 'About Movie'),
                Tab(text: 'Reviews'),
                Tab(text: 'Cast'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MovieTab(),
                  ReviewsTab(),
                  CastTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
