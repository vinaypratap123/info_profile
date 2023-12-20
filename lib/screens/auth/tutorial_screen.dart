import 'package:flutter/material.dart';
import 'package:info_profile/screens/auth/intro_screen1.dart';
import 'package:info_profile/screens/auth/intro_screen2.dart';
import 'package:info_profile/screens/auth/intro_screen3.dart';
import 'package:info_profile/screens/auth/login_screen.dart';
import 'package:info_profile/utils/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _controller = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void goToNextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void skipToLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: onPageChanged,
              children: const [
                IntroScreen1(),
                IntroScreen2(),
                IntroScreen3(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: skipToLogin,
                    child: const Text(
                      AppString.skip,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
                  currentPageIndex == 2
                      ? InkWell(
                          onTap: skipToLogin,
                          child: const Text(
                            AppString.done,
                          ),
                        )
                      : InkWell(
                          onTap: goToNextPage,
                          child: const Text(
                            AppString.next,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
