import 'package:flutter/material.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
import 'package:info_profile/presentation/screens/auth/login_screen.dart';
import 'package:info_profile/presentation/screens/auth/signup_screen.dart';
import 'package:info_profile/presentation/screens/auth/splash_screen.dart';
import 'package:info_profile/presentation/screens/auth/tutorial_screen.dart';
import 'package:info_profile/presentation/screens/home/home_screen.dart';
import 'package:info_profile/presentation/screens/home/main_screen.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesName.splashScreen:
        {
          return routeBuilder(const SplashScreen());
        }
      case RoutesName.tutorialScreen:
        {
          return routeBuilder(const TutorialScreen());
        }
      case RoutesName.signup:
        {
          return routeBuilder(const SignupScreen());
        }
      // case RoutesName.login:
      //   {
      //     return routeBuilder(const LoginScreen());
      //   }
      case RoutesName.homeScreen:
        {
          return routeBuilder(const HomeScreen());
        }
      // case RoutesName.mainScreen:
      //   {
      //     return routeBuilder( MainScreen(uid: '',));
      //   }
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

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
