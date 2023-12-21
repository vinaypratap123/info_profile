import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class BorderedButton extends StatelessWidget {
  final String? buttonName;
  final Icon? buttonIcon;
  final VoidCallback onTap;
  final double height;
  final double width;
  const BorderedButton(
      {super.key,
      this.buttonName,
      this.buttonIcon,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondaryColor),
              borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
          child: buttonIcon != null && buttonName != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonIcon!,
                    const SizedBox(
                      width: 5,
                    ),
                    Text(buttonName!)
                  ],
                )
              : buttonName != null
                  ? Center(
                      child: Text(
                      buttonName!,
                    ))
                  : Center(child: buttonIcon)),
    );
  }
}
