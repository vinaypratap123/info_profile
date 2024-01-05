import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_profile/firebase_options.dart';
import 'package:info_profile/presentation/cubit/auth/auth_cubit.dart';
import 'package:info_profile/presentation/cubit/auth/auth_state.dart';
import 'package:info_profile/presentation/cubit/credential/credential_cubit.dart';
import 'package:info_profile/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:info_profile/presentation/cubit/user/user_cubit.dart';
import 'package:info_profile/presentation/routes/on_generate_route.dart';
import 'package:info_profile/presentation/screens/auth/login_screen.dart';
import 'package:info_profile/presentation/screens/home/main_screen.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(context),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<GetSingleUserCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(
                    uid: authState.uid,
                  );
                } else {
                  return const LoginScreen();
                }
              },
            );
          }
        },
      ),
    );
  }
}
