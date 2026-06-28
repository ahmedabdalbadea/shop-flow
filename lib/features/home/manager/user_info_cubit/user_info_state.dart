part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoSuccess extends UserInfoState {
  final UserModel user;

  UserInfoSuccess(this.user);
}

final class UserInfoLoading extends UserInfoState {}

final class UserInfoFailure extends UserInfoState {
  final String errMsg;

  UserInfoFailure(this.errMsg);
}
