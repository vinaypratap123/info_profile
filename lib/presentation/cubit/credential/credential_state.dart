import 'package:equatable/equatable.dart';

abstract class CredentialSate extends Equatable {
  const CredentialSate();
}

class CredentialInitial extends CredentialSate {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class CredentialLoading extends CredentialSate {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class CredentialSuccess extends CredentialSate {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class CredentialFailure extends CredentialSate {
  @override
  List<Object?> get props => throw UnimplementedError();
}
