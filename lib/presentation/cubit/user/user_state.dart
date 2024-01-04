import 'package:equatable/equatable.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserLoaded extends UserState {
  final List<UserEntity> users;

  const UserLoaded({required this.users});
  @override
  List<Object?> get props => [users];
}

class UserFailure extends UserState {
  @override
  List<Object?> get props => [throw UnimplementedError()];
}
