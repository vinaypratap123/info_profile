import 'package:equatable/equatable.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';

abstract class GetSingleUserState extends Equatable {
  const GetSingleUserState();
}

class GetSingleUserInitial extends GetSingleUserState {
  @override
  List<Object?> get props => [];
}

class GetSingleUserLoading extends GetSingleUserState {
  @override
  List<Object?> get props => [];
}

class GetSingleUserLoaded extends GetSingleUserState {
  final UserEntity user;

  const GetSingleUserLoaded({required this.user});
  @override
  List<Object?> get props => [user];
}

class GetSingleUserFailure extends GetSingleUserState {
  @override
  List<Object?> get props => [];
}
