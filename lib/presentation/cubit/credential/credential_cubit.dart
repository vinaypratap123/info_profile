import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signin_user_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/signup_user_usecase.dart';
import 'package:info_profile/presentation/cubit/credential/credential_state.dart';

class CredentialCubit extends Cubit<CredentialSate> {
  final SigninUserUseCase signinUserUseCase;
  final SignUpUserUseCase signUpUserUseCase;

  CredentialCubit(
      {required this.signinUserUseCase, required this.signUpUserUseCase})
      : super(CredentialInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await signinUserUseCase
          .call(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signinUserUseCase.call(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
