import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
// ******************** VARIABLES *********************

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final FocusNode? focusNode;
  final FocusNode? targetFocusNode;
  final String? Function(String?)? validator;
// ******************** CUSTOM TEXT FIELD CONSTRUCTOR *********************
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.isObscureText,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.targetFocusNode,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: validator,
        textInputAction: TextInputAction.next,
        focusNode: focusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(targetFocusNode);
        },
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isObscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelStyle: const TextStyle(color: AppColor.primaryColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.red)),
        ),
      ),
    );
  }
}
