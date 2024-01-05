import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:info_profile/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
import 'package:info_profile/presentation/cubit/user/get_single_user/get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase}) : super(GetSingleUserInitial());
  Future<void> getSingleUsers({required String uid}) async {
    emit(GetSingleUserLoading());
    try {
      final streamResponse = getSingleUserUseCase.call(uid);
      streamResponse.listen((users) {
        emit(GetSingleUserLoaded(user: users.first));
      });
    } on SocketException catch (_) {
      emit(GetSingleUserFailure());
    } catch (_) {
      emit(GetSingleUserFailure());
    }
  }
}
