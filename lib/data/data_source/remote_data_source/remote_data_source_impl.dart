import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:info_profile/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:info_profile/data/model/user/user_model.dart';
import 'package:info_profile/domain/entities/user/user_entity.dart';
import 'package:info_profile/presentation/helper/ui_helper.dart';
import 'package:info_profile/presentation/utils/firebase_strings.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDataSourceImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });
  // ************************ createUser *****************************
  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseString.users);
    final uid = await getCurrentUid();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
              uid: uid,
              name: user.name,
              userName: user.userName,
              email: user.email,
              about: user.about,
              profileUrl: user.profileUrl,
              website: user.website,
              followers: user.followers,
              following: user.following,
              totalFollowers: user.totalFollowers,
              totalFollowing: user.totalFollowing,
              totalPosts: user.totalPosts)
          .toJson();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      UiHelper.toast(error.toString());
    });
  }

  // ************************ getCurrentUid *****************************
  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;

  // ************************ getSingleUser *****************************
  @override
  Stream<List<UserEntity>> getSingleUser(String userId) {
    final userCollection = firebaseFirestore
        .collection(FirebaseString.users)
        .where("userId", isEqualTo: userId)
        .limit(1);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  // ************************ getUsers *****************************
  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseString.users);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  // ************************ isSignIn *****************************
  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  // ************************ signInUser *****************************
  @override
  Future<void> signInUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: user.email!, password: user.password!);
      } else {
        UiHelper.toast("please enter all the fields");
      }
    } on FirebaseAuthException catch (error) {
      UiHelper.toast(error.code.toString());
    }
  }

  // ************************ signOut *****************************
  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // ************************ signOut *****************************
  @override
  Future<void> signUpUser(UserEntity user) async {
    try {
      if (user.email!.isNotEmpty && user.name!.isNotEmpty) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: user.email!, password: user.password!)
            .then((value) async {
          if (value.user?.uid != null) {
            await createUser(user);
          }
        });
        return;
      }
    } on FirebaseAuthException catch (error) {
      UiHelper.toast(error.code.toString());
    }
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseString.users);
    Map<String, dynamic> userInformation = {};
    if (user.name != "" && user.name != null) {
      userInformation["name"] = user.name;
    }
    if (user.userName != "" && user.userName != null) {
      userInformation["userName"] = user.userName;
    }
    if (user.email != "" && user.email != null) {
      userInformation["email"] = user.email;
    }
    if (user.about != "" && user.about != null) {
      userInformation["about"] = user.about;
    }
    if (user.totalFollowers != null) {
      userInformation["totalFollowers"] = user.totalFollowers;
    }
    if (user.totalFollowing != null) {
      userInformation["totalFollowing"] = user.totalFollowing;
    }
    if (user.totalPosts != null) {
      userInformation["totalPosts"] = user.totalPosts;
    }

    userCollection.doc(user.uid).update(userInformation);
  }
}
