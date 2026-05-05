part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final UserModel user;

  SignUpSuccess({required this.user});
}

abstract class AuthFailureState extends AuthState {
  final String errMsg;
  AuthFailureState(this.errMsg);
}

final class SignUpFailure extends AuthFailureState {
  SignUpFailure(super.errMsg);
}

final class GoogleSignInSuccess extends AuthState {
  final UserModel? user;
  GoogleSignInSuccess({required this.user});
}

final class GoogleSignInFailure extends AuthFailureState {
  GoogleSignInFailure(super.errMsg);
}
