import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/auth/data/auth_remote_data_source.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shop_flow/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(
          AuthRepoImpl(AuthRemoteDataSource(FirebaseAuth.instance)),
        ),
        child: SignInViewBody(),
      ),
    );
  }
}
