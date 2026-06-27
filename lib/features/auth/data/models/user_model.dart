import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uId;
  final String? name;
  final String email;

  const UserModel({required this.uId, required this.email, this.name});

  factory UserModel.fromUserCredential(UserCredential credential) {
    return UserModel(
      uId: credential.user!.uid,
      email: credential.user!.email!,
      name: credential.user!.displayName ?? "user",
    );
  }

  Map<String, dynamic> toJson() {
    return {'uId': uId, 'name': name, 'email': email};
  }
}
