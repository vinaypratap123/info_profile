import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class ProfileFormWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  const ProfileFormWidget({super.key, this.controller, required this.title});

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(color: AppColor.blackColor, fontSize: 16),
        ),
        const Gap(10),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: AppColor.blackColor),
          decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: AppColor.blackColor)),
        ),
        const Divider(
          thickness: 1,
          color: AppColor.darkBlackColor,
        )
      ],
    );
  }
}
