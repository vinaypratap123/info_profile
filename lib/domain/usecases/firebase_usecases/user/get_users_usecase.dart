import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/domain/repository/firebase_repository.dart';

class GetUsersUseCase {
  final FirebaseRepository repository;

  GetUsersUseCase({required this.repository});
  Stream<List<UserEntity>> call(UserEntity user) {
    return repository.getUsers(user);
  }
}
