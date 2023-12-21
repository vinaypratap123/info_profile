import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
// ******************** VARIABLES *********************

  final bool isUnderline;
  final String buttonName;

  final Color? buttonColor;

  final VoidCallback onTap;
// ******************** RECTANGLE BUTTON CONSTRUCTOR *********************
  const CustomTextButton({
    Key? key,
    required this.isUnderline,
    required this.buttonName,
    this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 18,
              color: buttonColor,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none),
        ));
  }
}
