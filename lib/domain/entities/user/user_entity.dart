import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? userName;
  final String? about;
  final String? email;
  final String? website;
  final String? profileUrl;
  final List? followers;
  final String? following;
  final num? totalFollowers;
  final num? totalFollowing;
  final num? totalPosts;
  final String? password;
  final String? otherUid;

  const UserEntity(
    this.uid,
    this.name,
    this.userName,
    this.about,
    this.email,
    this.website,
    this.profileUrl,
    this.followers,
    this.following,
    this.totalFollowers,
    this.totalFollowing,
    this.totalPosts,
    this.password,
    this.otherUid, 
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        userName,
        about,
        email,
        website,
        profileUrl,
        followers,
        following,
        totalFollowers,
        totalFollowing,
        totalPosts,
        password,
        otherUid,
      ];
}
