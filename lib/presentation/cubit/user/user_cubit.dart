import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/get_users_usecase.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/update_user_usecase.dart';
import 'package:info_profile/presentation/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetUsersUseCase getUsersUseCase;
  UserCubit({required this.updateUserUseCase, required this.getUsersUseCase})
      : super(UserInitial());

  Future<void> getUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      final streamResponse = getUsersUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    try {
      await updateUserUseCase.call(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
