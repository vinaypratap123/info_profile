import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/repository/firebase_repository.dart';

class SignUpUserUseCase {
  final FirebaseRepository repository;

  SignUpUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.signUpUser(user);
  }
}
