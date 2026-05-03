import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? name;
  final String email;

  const UserModel({required this.uid, required this.email, this.name});

  factory UserModel.fromUserCredential(UserCredential credential) {
    return UserModel(
      uid: credential.user!.uid,
      email: credential.user!.email!,
      name: credential.user?.displayName,
    );
  }
}
