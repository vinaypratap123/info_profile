import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
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

  const UserModel({
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
  }) : super(
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
          "",
          "",
        );
  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot["email"],
      name: snapshot["name"],
      about: snapshot["about"],
      profileUrl: snapshot["profileUrl"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      totalFollowers: snapshot[" totalFollowers"],
      totalFollowing: snapshot["totalFollowing"],
      website: snapshot["website"],
      totalPosts: snapshot["totalPosts"],
      userName: snapshot["userName"],
      uid: snapshot["uid"],
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "userName": userName,
        "about": about,
        "email": email,
        "website": website,
        "profileUrl": profileUrl,
        "followers": followers,
        "following": following,
        "totalFollowers": totalFollowers,
        "totalFollowing": totalFollowing,
        "totalPosts": totalFollowing,
      };
}
