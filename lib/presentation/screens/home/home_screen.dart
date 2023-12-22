import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';
import 'package:info_profile/presentation/utils/app_images.dart';
import 'package:info_profile/presentation/widgets/specific_widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Image.asset(AppImage.whiteNameLogo),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(CommunityMaterialIcons.facebook_messenger),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder:(context, index) {
          return const PostCard();
        },
        ),
    );
  }
}
