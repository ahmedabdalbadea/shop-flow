part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final UserModel user;

  SignUpSuccess({required this.user});
}

final class SignUpFailure extends AuthState {
  final String errMsg;

  SignUpFailure(this.errMsg);
}
