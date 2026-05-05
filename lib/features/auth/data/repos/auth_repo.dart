import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel?>> signInWithGoogle();
}
