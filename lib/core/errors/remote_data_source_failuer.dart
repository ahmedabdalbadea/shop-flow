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
      case 'operation-not-allowed':
        return RemoteDataSourceFailure('This sign-in method is not allowed');
      case 'email-not-verified':
        return RemoteDataSourceFailure('Please verify your email first');
      case 'requires-recent-login':
        return RemoteDataSourceFailure('Please sign in again to continue');
      case 'credential-already-in-use':
        return RemoteDataSourceFailure(
          'This account is already linked to another user',
        );
      case 'popup-closed-by-user':
        return RemoteDataSourceFailure('Sign in was cancelled');
      case 'account-exists-with-different-credential':
        return RemoteDataSourceFailure(
          'Account already exists with a different sign-in method',
        );
      case 'invalid-credential':
        return RemoteDataSourceFailure('Invalid credentials, please try again');
      case 'user-disabled':
        return RemoteDataSourceFailure('This account has been disabled');
      case 'too-many-requests':
        return RemoteDataSourceFailure(
          'Too many attempts, please try again later',
        );
      default:
        return RemoteDataSourceFailure(e.message ?? 'Unknown error');
    }
  }

  factory RemoteDataSourceFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return RemoteDataSourceFailure(
          'You do not have permission to perform this action',
        );
      case 'unavailable':
        return RemoteDataSourceFailure(
          'Service is temporarily unavailable, please check your internet',
        );
      case 'not-found':
        return RemoteDataSourceFailure('The requested document was not found');
      case 'already-exists':
        return RemoteDataSourceFailure('The document already exists');
      case 'deadline-exceeded':
        return RemoteDataSourceFailure(
          'The operation timed out, please try again',
        );
      default:
        return RemoteDataSourceFailure(
          e.message ?? 'A database error occurred, please try again',
        );
    }
  }
}
