import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';
import 'package:info_profile/presentation/widgets/specific_widgets/post_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Vinay Pratap"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              child: Center(
            child: ListTile(
              leading: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: Colors.purple,
                ),
              ),
              title: const Text("Vinay Pratap"),
              subtitle: const Text("busy"),
            ),
          )),
          const SizedBox(
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(AppString.posts), Gap(5), Text("12")],
                  ),
                  Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(AppString.followers), Gap(5), Text("12M")],
                  ),
                  Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(AppString.following), Gap(5), Text("12M")],
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const PostCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
