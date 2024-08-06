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
          leading: const BackButton(color: Colors.white,),
          title: Text('Detail Screen',style: TextStyles.font23semiBold,),
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
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Spiderman No Way Home',
                    style: TextStyles.font18SemiBoldWhite
                  ),
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
