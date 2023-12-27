import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/repository/firebase_repository.dart';

class CreateUserUseCase {
  final FirebaseRepository repository;

  CreateUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.createUser(user);
  }
}
