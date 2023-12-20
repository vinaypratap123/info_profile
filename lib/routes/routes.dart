import 'package:flutter/material.dart';
import 'package:info_profile/routes/routes_name.dart';
import 'package:info_profile/screens/auth/splash_screen.dart';
import 'package:info_profile/screens/auth/tutorial_screen.dart';
import 'package:info_profile/utils/app_strings.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
// ************ SPLASH SCREEN ROUTE *******************
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

// ************ TUTORIAL SCREEN ROUTE *******************
      case RoutesName.tutorialScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TutorialScreen());

// ************ SIGNUP SCREEN ROUTE *******************
      // case RoutesName.signup:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SignUpScreen());

// ************ VERIFY OTP SCREEN ROUTE *******************
      // case RoutesName.verifyOtp:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => VerifyOtpScreen(
      //             userEmail: settings.arguments as String,
      //           ));

// ************ LOGIN SCREEN ROUTE *******************
      // case RoutesName.login:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LoginScreen());

// ************ FORGOT PASSWORD SCREEN ROUTE *******************
      // case RoutesName.forgotPassword:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ForgotPasswordScreen());

// ************ FORGOT PASSWORD OTP SCREEN ROUTE *******************
      // case RoutesName.forgotPasswordOtp:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ForgotPAsswordOtpScreen(
      //             userEmail: settings.arguments as String,
      //           ));

// ************ BOTTOM NAVBAR SCREEN ROUTE *******************
      // case RoutesName.bottomNavbar:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const BottomNavBarScreen());

// ************ HOME SCREEN ROUTE *******************
      // case RoutesName.home:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => HomeScreen());

// ************ POST SCREEN ROUTE *******************
      // case RoutesName.post:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PostScreen());

// ************ SEARCH SCREEN ROUTE *******************
      // case RoutesName.search:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SearchScreen());

// ************ MY PROFILE SCREEN ROUTE *******************
      // case RoutesName.myProfile:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const MyProfile());

// ************ FOLLOWER SCREEN ROUTE *******************
      // case RoutesName.follower:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const FollowersScreen());

// ************ FOLLOWING SCREEN ROUTE *******************
      // case RoutesName.following:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const FollowingScreen());

// ************ EDIT PROFILE SCREEN ROUTE *******************
      // case RoutesName.editProfile:
      //   final Map<String, dynamic> args =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>
      //           EditProfileScreen(userData: args));

// ************ COMMENT ON POST SCREEN ROUTE *******************
      // case RoutesName.commentOnPost:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>
      //           CommentOnPostScreen(data: settings.arguments as Map));

// ************ NOTIFICATION SCREEN ROUTE *******************
      // case RoutesName.notificationListScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const NotificatonListScreen());

// ************ CONTACT SCREEN ROUTE *******************
      // case RoutesName.contacts:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ContactsScreen());

// ************ DEFAULT ROUTE *******************
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text(AppString.noSuchRoueDefined),
            ),
          );
        });
    }
  }
}
