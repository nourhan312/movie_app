import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';
import 'package:movie_app/core/widgets/primary_color_widget.dart';
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
      body: PrimaryColorWidget(
        child: Stack(
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
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Image.asset("assets/images/icon_back.png",
                              width: 14, height: 24)),
                      const SizedBox(width: 20),
                      Image.asset("assets/images/logo.png",
                          width: 182, height: 49),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyles.textSkip,
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
                      color: _currentPage == index ? Colors.black : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
