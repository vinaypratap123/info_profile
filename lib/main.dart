import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_profile/firebase_options.dart';
import 'package:info_profile/presentation/routes/routes_name.dart';
import 'package:info_profile/presentation/screens/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        // initialRoute: RoutesName.splashScreen,
        initialRoute: RoutesName.signup,
        home: const SignupScreen());
  }
}
