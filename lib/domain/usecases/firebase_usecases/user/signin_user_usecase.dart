import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/repository/firebase_repository.dart';

class SigninUserUseCase {
  final FirebaseRepository repository;

  SigninUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.signInUser(user);
  }
}
