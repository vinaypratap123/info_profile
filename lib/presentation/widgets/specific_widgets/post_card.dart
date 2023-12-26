import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.65,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.green),
              child: const Center(
                  child: Text(
                "V",
                style: TextStyle(fontSize: 30, color: AppColor.white),
              )),
            ),
            title: const Text("Vinay pratap"),
            subtitle: const Text("user name"),
            trailing: const Icon(Icons.more_vert),
          ),
          const Gap(10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("description"),
              ],
            ),
          ),
          const Gap(10),
          SizedBox(
            height: height * 0.4,
            child: Image.asset(
              AppImage.background,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up_outlined),
                    const Gap(10),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.commentScreen);
                        },
                        child: const Icon(FeatherIcons.messageCircle)),
                    const Gap(10),
                    const Icon(FeatherIcons.send),
                  ],
                ),
                const Row(
                  children: [Icon(Icons.bookmark_border)],
                ),
              ],
            ),
          ),
          const Gap(10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(AppString.viewAll),
                Text("20 "),
                Text(AppString.comments),
              ],
            ),
          )
        ],
      ),
    );
  }
}
