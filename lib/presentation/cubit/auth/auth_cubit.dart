import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/get_current_uid_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/is_signin_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signout_usecase.dart';
import 'package:info_profile/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSigninUseCase isSigninUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  AuthCubit(
      {required this.signOutUseCase,
      required this.isSigninUseCase,
      required this.getCurrentUserUseCase})
      : super(AuthInitial());
  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSigninUseCase.call();
      if (isSignIn) {
        final String uid = await getCurrentUserUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final String uid = await getCurrentUserUseCase.call();
      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
