import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theming/text_style.dart';
import 'package:movie_app/features/details/ui/widgets/cast_tab.dart';
import 'package:movie_app/features/details/ui/widgets/fav_icon.dart';
import 'package:movie_app/features/details/ui/widgets/movie_tab.dart';
import 'package:movie_app/features/details/ui/widgets/reviwes_tab.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xff242A32),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: Text(
            'Detail Screen',
            style: TextStyles.font23semiBold,
          ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: CachedNetworkImage(
                      width: 375,
                      height: 231,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
                    ),
                  ),

                  // Image.asset(
                  //   'assets/images/back_ground.png',
                  //   fit: BoxFit.cover,
                  //   width: 375,
                  //   height: 211,
                  // ),
                ),
                Positioned(
                  bottom: -30,
                  left: 29.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Spiderman No Way Home',
                      style: TextStyles.font18SemiBoldWhite),
                ],
              ),
            ),
            TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
              unselectedLabelColor: Colors.white.withOpacity(.4),
              tabs: const [
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
