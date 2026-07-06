import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/helpers/formate_name.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/manager/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserHomeGreeting extends StatefulWidget {
  const UserHomeGreeting({super.key});

  @override
  State<UserHomeGreeting> createState() => _UserHomeGreetingState();
}

class _UserHomeGreetingState extends State<UserHomeGreeting> {
  bool isVisiable = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(minutes: 1), () {
      if (mounted) {
        setState(() {
          isVisiable = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          return Visibility(
            visible: isVisiable,
            child: Text(
              "Hello, ${formateName(state.user.name)![0]}",
              style: AppFontStyles.styleSemiBold14.copyWith(
                color: kThrTextColor,
              ),
            ),
          );
        } else if (state is UserInfoFailure) {
          return Text(
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
