import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_flow/features/auth/data/models/user_model.dart';
import 'package:shop_flow/features/home/data/repos/home_repo.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._homeRepo) : super(UserInfoInitial());

  final HomeRepo _homeRepo;

  Future<void> getUserInfo({required String uId}) async {
    emit(UserInfoLoading());
    var data = await _homeRepo.getUserInfo(uId);

    data.fold(
      (failure) {
        emit(UserInfoFailure(failure.errMsg));
      },
      (user) {
        emit(UserInfoSuccess(user));
      },
    );
  }
}
