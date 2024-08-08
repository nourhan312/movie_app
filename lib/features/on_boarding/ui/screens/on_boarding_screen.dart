import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/theming/text_style.dart';
import 'package:movie_app/features/on_boarding/ui/screens/on_boarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    context.pushReplacementNamed(Routes.loginScreen);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  "Skip",
                  style: TextStyles.font18SemiBoldWhite,
                )),
          )
        ],
      ),
      backgroundColor: const Color(0xff242A32),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                OnboardingPage(
                  image: 'assets/images/on_boarding1.png',
                  text: 'Find the latest and greatest\n movies of all time..',
                ),
                OnboardingPage(
                  image: 'assets/images/on_boarding2.png',
                  text: 'Enjoy latest shows,movies\n all for free of cost',
                ),
                OnboardingPage(
                  image: 'assets/images/on_boarding3.png',
                  text: 'Almost ready to go. Enjoy!.',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(3, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color.fromRGBO(255, 255, 255, 0.2)
                      : Colors.white,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}
