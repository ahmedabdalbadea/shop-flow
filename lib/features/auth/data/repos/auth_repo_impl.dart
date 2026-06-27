import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/auth/data/auth_remote_data_source.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/core/errors/remote_data_source_failuer.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authRemoteDataSource.signUp(email, password);
      final firestoreResult = await _saveUserToFirestoreHelper(
        uId: credential.user!.uid,
        name: name,
        email: email,
      );
      return firestoreResult.fold(
        (failure) => left(failure),
        (_) => right(UserModel.fromUserCredential(credential)),
      );
    } on FirebaseAuthException catch (e) {
      return left(RemoteDataSourceFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(
        RemoteDataSourceFailure("Unexpected error, please try again"),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authRemoteDataSource.signIn(email, password);
      return right(UserModel.fromUserCredential(credential));
    } on FirebaseAuthException catch (e) {
      return left(RemoteDataSourceFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(
        RemoteDataSourceFailure("Unexpected error, please try again"),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel?>> signInWithGoogle() async {
    try {
      final credential = await _authRemoteDataSource.signInWithGoogle();

      if (credential == null) {
        return right(null);
      }
      final firestoreResult = await _saveUserToFirestoreHelper(
        uId: credential.user!.uid,
        name: credential.user!.displayName ?? "Google User",
        email: credential.user!.email ?? "",
      );
      return firestoreResult.fold(
        (failure) => left(failure),
        (_) => right(UserModel.fromUserCredential(credential)),
      );
    } on FirebaseAuthException catch (e) {
      return left(RemoteDataSourceFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return left(
        RemoteDataSourceFailure("Unexpected error, please try again"),
      );
    }
  }

  Future<Either<Failure, void>> _saveUserToFirestoreHelper({
    required String uId,
    required String name,
    required String email,
  }) async {
    try {
      await _authRemoteDataSource.addUserToCollection(
        uId: uId,
        name: name,
        email: email,
      );
      return right(null);
    } on FirebaseException catch (e) {
      return left(RemoteDataSourceFailure.fromFirebaseException(e));
    } catch (e) {
      return left(
        RemoteDataSourceFailure("Unexpected error, please try again"),
      );
    }
  }
}
