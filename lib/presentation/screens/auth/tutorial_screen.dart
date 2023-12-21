import 'package:flutter/material.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
import 'package:info_profile/presentation/screens/auth/intro_screen1.dart';
import 'package:info_profile/presentation/screens/auth/intro_screen2.dart';
import 'package:info_profile/presentation/screens/auth/intro_screen3.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';
import 'package:info_profile/presentation/widgets/common_widgets/buttons/bordered_button.dart';
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.login,
      (route) => false,
    );
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
                  BorderedButton(
                      buttonName: AppString.skip,
                      onTap: skipToLogin,
                      height: 30,
                      width: 60),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
                  currentPageIndex == 2
                      ? BorderedButton(
                          buttonName: AppString.done,
                          onTap: skipToLogin,
                          height: 30,
                          width: 60)
                      : BorderedButton(
                          buttonName: AppString.next,
                          onTap: goToNextPage,
                          height: 30,
                          width: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
