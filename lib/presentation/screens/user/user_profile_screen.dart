import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => _openModelBottomSheet(context), // Fix here
              child: const Icon(Icons.menu),
            ),
          ),
        ],
        // actions:[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: InkWell(
        //       onTap: _openModelBottomSheet(context),
        //       child: const Icon(Icons.menu)),
        //   )
        // ],
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
                child: const Center(
                    child: Text(
                  "V",
                  style: TextStyle(fontSize: 30, color: AppColor.white),
                )),
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

  _openModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                    topRight: Radius.circular(120)),
                color: AppColor.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      "More Options",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColor.blackColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                               Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, RoutesName.editProfile);
                            
                              //  Navigator.pop(context);
                            },
                            child: const Text("Edit Profile")),
                        const Gap(5),
                        const Icon(
                          Icons.edit,
                          size: 16,
                          color: AppColor.primaryColor,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColor.blackColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(color: AppColor.red),
                        ),
                        Gap(5),
                        Icon(
                          Icons.login_outlined,
                          size: 16,
                          color: AppColor.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
