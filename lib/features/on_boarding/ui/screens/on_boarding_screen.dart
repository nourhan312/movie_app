import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xff242A32),
      body: Stack(
        children: [
          PageView(
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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Image.asset(
                    "assets/images/icon_back.png",
                    width: 14,
                    height: 24,
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(3, (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? const Color.fromRGBO(255, 255, 255, 0.2)
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}