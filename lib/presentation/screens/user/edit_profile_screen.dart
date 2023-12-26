import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/widgets/specific_widgets/profile_form_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
        title: const Text("Edit Profile"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColor.primaryColor),
                ),
              ),
              const Gap(15),
              const Text(
                "Change Profile Photo",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: AppColor.primaryColor),
              ),
              const Gap(15),
              const ProfileFormWidget(title: "Name"),
              const Gap(15),
              const ProfileFormWidget(title: "User Name"),
              const Gap(15),
              const ProfileFormWidget(title: "Website"),
              const Gap(15),
              const ProfileFormWidget(title: "About"),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}
