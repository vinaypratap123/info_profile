import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Authenticated extends AuthState {
  final String uid;

  const Authenticated({required this.uid});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
