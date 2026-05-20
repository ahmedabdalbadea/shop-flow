import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_flow/core/utils/api_service.dart';
import 'package:shop_flow/features/auth/data/auth_remote_data_source.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo.dart';
import 'package:shop_flow/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shop_flow/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(FirebaseAuth.instance),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt.get<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(getIt.get<ApiService>()),
  );
}
