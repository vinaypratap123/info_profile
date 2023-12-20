import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_profile/utils/app_images.dart';
import 'package:info_profile/utils/app_strings.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({super.key});

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
             AppString.connectWithThePeopleAroundYou,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: height * 0.5,
            child: Image.asset(
              AppImage.connectedWorld,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
