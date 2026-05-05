import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/auth/data/auth_remote_data_source.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/features/auth/data/remote_data_source_failuer.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _authRemoteDataSource.signUp(email, password);
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
      return right(
        credential == null ? null : UserModel.fromUserCredential(credential),
      );
    } on FirebaseAuthException catch (e) {
      return left(RemoteDataSourceFailure.fromFirebaseAuthException(e));
    } catch (e) {
      print("=================>${e.toString()}");
      return left(
        RemoteDataSourceFailure("Unexpected error, please try again"),
      );
    }
  }
}
