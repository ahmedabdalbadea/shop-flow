import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/manager/user_info_cubit/user_info_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserHomeGreeting extends StatelessWidget {
  const UserHomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          return Text(
            "Hello, ${state.user.name}",
            style: AppFontStyles.styleSemiBold14.copyWith(color: kThrTextColor),
          );
        } else if (state is UserInfoFailure) {
          Text(
            state.errMsg,
            style: AppFontStyles.styleSemiBold14.copyWith(color: kErrorColor),
          );
        }
        return Skeletonizer(
          child: const Text(
            "Hello, Userjjjflas",
            style: AppFontStyles.styleSemiBold14,
          ),
        );
      },
    );
  }
}
