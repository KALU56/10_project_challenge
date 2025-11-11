import 'package:dio/dio.dart';
import 'package:eotc_melodies/core/constants/api_constants.dart';
import 'package:eotc_melodies/core/network/http_service/http_service.dart';
import 'package:eotc_melodies/core/network/http_service/http_service_impl.dart';
import 'package:eotc_melodies/features/auth/data/datasources/auth_data_source.dart';
import 'package:eotc_melodies/features/auth/domain/repositories/auth_repository.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/get_session_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_up_zemari_usecase.dart';
import 'package:eotc_melodies/features/auth/domain/usecases/sign_usecase.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/sign_up_user_usecase.dart';

final sl = GetIt.instance;


Future<void> init() async {
  // =========================
  // Core / External Services
  // =========================
  sl.registerLazySingleton<HttpService>(
    () => DioHttpService(
      dio: Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {'Content-Type': 'application/json'},
        ),
      ),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUserUseCase(sl()));
  sl.registerLazySingleton(() => SignUpZemariUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => GetSessionUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
}
