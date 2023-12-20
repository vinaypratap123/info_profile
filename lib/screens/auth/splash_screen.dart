import 'dart:async';

import 'package:flutter/material.dart';
import 'package:info_profile/screens/auth/tutorial_screen.dart';
import 'package:info_profile/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const TutorialScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            SizedBox(
              height: height * 0.4,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.5,
                    child: Image.asset(
                      AppImage.circleLogo,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width * 0.5,
                    child: Image.asset(
                      AppImage.nameLogo,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.4,
              width: width,
              child: Image.asset(
                AppImage.splashPerson,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
