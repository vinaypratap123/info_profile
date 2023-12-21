import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
// ******************** VARIABLES *********************

  final TextEditingController? controller;

  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;

  final Icon? prefixIcon;
  final Icon? suffixIcon;

// ******************** CUSTOM TEXT FIELD CONSTRUCTOR *********************
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.fieldKey,
      this.isPasswordField,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.onFieldSubmitted});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColor.primaryColor),
          prefixIcon: widget.prefixIcon,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: widget.isPasswordField == true
                  ? Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    )
                  : const Text("")),
          hintText: widget.hintText,
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
