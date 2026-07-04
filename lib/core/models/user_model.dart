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

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      uId: data['uId'] as String,
      email: data['email'] as String,
      name: data['name'] as String? ?? 'User',
    );
  }

  Map<String, dynamic> toJson() {
    return {'uId': uId, 'name': name, 'email': email};
  }
}
