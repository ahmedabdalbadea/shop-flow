import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/manager/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:shop_flow/features/profile/view/widgets/user_info_content.dart';
import 'package:shop_flow/features/profile/view/widgets/user_info_error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          return UserInfoContent(user: state.user);
        } else if (state is UserInfoFailure) {
          return Center(child: UserInfoError(errMsg: state.errMsg));
        }
        return Skeletonizer(child: UserInfoContent(user: null));
      },
    );
  }
}
