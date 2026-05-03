import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_flow/core/errors/failure.dart';

class RemoteDataSourceFailure extends Failure {
  RemoteDataSourceFailure(super.errMsg);

  factory RemoteDataSourceFailure.fromFirebaseAuthException(
    FirebaseAuthException e,
  ) {
    switch (e.code) {
      case 'email-already-in-use':
        return RemoteDataSourceFailure('Email is already in use');
      case 'invalid-email':
        return RemoteDataSourceFailure('Invalid email address');
      case 'weak-password':
        return RemoteDataSourceFailure('Password is too weak');
      case 'user-not-found':
        return RemoteDataSourceFailure('No user found with this email');
      case 'wrong-password':
        return RemoteDataSourceFailure('Incorrect password');
      case 'network-request-failed':
        return RemoteDataSourceFailure('No internet connection');
      default:
        return RemoteDataSourceFailure(e.message ?? 'Unknown error');
    }
  }
}
