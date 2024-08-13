import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key, required this.pageController, required this.controller});
  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      color: Colors.white10,
      showLabel: true,
      textOverflow: TextOverflow.visible,
      maxLine: 1,
      shadowElevation: 5,
      kBottomRadius: 15.0,
      notchColor: Colors.white,
      removeMargins: false,
      bottomBarWidth: 500.w,
      showShadow: false,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(fontSize: 10, color: Colors.white),
      elevation: 1,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.search, color: Colors.white),
          activeItem: Icon(
            Icons.search,
            color: Colors.black,
          ),
          itemLabel: 'Search',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.favorite,
            color: Colors.pink,
          ),
          itemLabel: 'Favourite',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.category,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.category,
            color: Colors.deepPurple,
          ),
          itemLabel: 'Categories',
        ),
      ],
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      kIconSize: 24.0,
    );
  }
}
