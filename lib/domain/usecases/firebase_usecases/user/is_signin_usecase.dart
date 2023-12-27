import 'package:info_profile/domain/repository/firebase_repository.dart';

class IsSigninUseCase {
  final FirebaseRepository repository;

  IsSigninUseCase({required this.repository});
  Future<bool> call() {
    return repository.isSignIn();
  }
}
