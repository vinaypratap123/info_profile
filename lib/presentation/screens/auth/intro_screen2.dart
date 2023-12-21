import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppString.viewInformationWithTheHelpOfVisitingCard,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: height * 0.4,
              width: double.infinity,
              child: Image.asset(
                AppImage.viewInfo,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
