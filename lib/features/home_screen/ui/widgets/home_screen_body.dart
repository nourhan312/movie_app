import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/features/home_screen/ui/widgets/trending_list_view_item.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import 'movie_tab.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20),
          child: Row(
            children: [
              Text(
                "What do you want to watch?",
                style: TextStyles.font18SemiBoldWhite,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pushNamed(Routes.searchScreen);
                },
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 295,
          child: CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return TrendingListViewItem(index: index);
            },
            options: CarouselOptions(
                height: 295,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 2)),
          ),
        ),
        const MovieTabs()
      ],
    );
  }
}
