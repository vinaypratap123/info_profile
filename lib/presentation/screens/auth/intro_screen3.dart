import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({super.key});

  @override
  State<IntroScreen3> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(AppString.youCanDoMuchMoreWithInfoprofile,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: height * 0.4,
            width: double.infinity,
            child: Image.asset(
              AppImage.moreUpdate,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
