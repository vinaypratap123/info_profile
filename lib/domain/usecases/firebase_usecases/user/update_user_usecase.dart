import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/repository/firebase_repository.dart';

class UpdateUserUseCase {
  final FirebaseRepository repository;

  UpdateUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.updateUser(user);
  }
}
