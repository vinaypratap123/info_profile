import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class AppStyle {
  // button
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle whiteButtonStyle = TextStyle(
    fontSize: 16,
    color: AppColor.white,
    fontWeight: FontWeight.w900,
  );

  // card heading
  static const TextStyle cardHeading = TextStyle(
    fontSize: 20,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle cardWhiteHeading = TextStyle(
    fontSize: 20,
    color: AppColor.white,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle cardText = TextStyle(
    fontSize: 16,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w700,
  );

// small text
  static const TextStyle smallText = TextStyle(
    fontSize: 13,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle smallWhiteText = TextStyle(
    fontSize: 13,
    color: AppColor.white,
    fontWeight: FontWeight.w700,
  );

  // regular text
  static const TextStyle regularText = TextStyle(
    fontSize: 18,
    color: AppColor.darkBlackColor,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle regularBlackText = TextStyle(
    fontSize: 18,
    color: AppColor.blackColor,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle regularWhiteText = TextStyle(
    fontSize: 18,
    color: AppColor.white,
    fontWeight: FontWeight.w900,
  );
}
