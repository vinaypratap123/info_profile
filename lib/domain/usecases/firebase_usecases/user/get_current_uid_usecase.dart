import 'package:info_profile/domain/repository/firebase_repository.dart';

class GetCurrentUserUseCase {
  final FirebaseRepository repository;

  GetCurrentUserUseCase({required this.repository});
  Future<String> call() {
    return repository.getCurrentUid();
  }
}
