import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_profile/presentation/screens/activity_screen.dart';
import 'package:info_profile/presentation/screens/home/add_post_screen.dart';
import 'package:info_profile/presentation/screens/home/home_screen.dart';
import 'package:info_profile/presentation/screens/home/search_screen.dart';
import 'package:info_profile/presentation/screens/user/user_profile.dart';
import 'package:info_profile/presentation/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined)),
        ],
        onTap: navigationTapped,
        currentIndex: currentIndex,
        activeColor: AppColor.primaryColor,
        inactiveColor: AppColor.darkBlackColor,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          SearchScreen(),
          AddPostScreen(),
          ActivityScreen(),
          UserProfileScreen(),
        ],
      ),
    );
  }
}
