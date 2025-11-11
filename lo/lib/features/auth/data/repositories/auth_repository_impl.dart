// data/repositories/auth_repository_impl.dart
import 'package:eotc_melodies/features/auth/data/datasources/auth_data_source.dart';
import 'package:eotc_melodies/shared/models/zemari_profile_model.dart';

import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../mapper/auth_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthEntity> signIn(String email, String password) async {
    final response = await remoteDataSource.signIn(email: email, password: password);
    return AuthMapper.fromJson(response);
  }

  @override
  Future<AuthEntity> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.signUp(
      name: name,
      email: email,
      password: password,
      role: "USER",
    );
    return AuthMapper.fromJson(response);
  }

  @override
  Future<AuthEntity> signUpZemari({
    required String name,
    required String email,
    required String password,
    required ZemariProfileModel zemariProfile,
  }) async {
    if (zemariProfile.stageName.isEmpty ||
        zemariProfile.churchName.isEmpty ||
        zemariProfile.organization.isEmpty ||
        zemariProfile.certificateUrl.isEmpty) {
      throw Exception("All ZEMARI profile fields are required");
    }

    final response = await remoteDataSource.signUp(
      name: name,
      email: email,
      password: password,
      role: "ZEMARI",
      zemariProfile: {
        "stageName": zemariProfile.stageName,
        "churchName": zemariProfile.churchName,
        "organization": zemariProfile.organization,
        "certificateUrl": zemariProfile.certificateUrl,
        "bio": zemariProfile.bio,
        "profileImage": zemariProfile.profileImage,
      },
    );

    return AuthMapper.fromJson(response);
  }

  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  @override
  Future<AuthEntity> getSession() async {
    final response = await remoteDataSource.getSession();
    return AuthMapper.fromJson(response);
  }

  @override
  Future<AuthEntity> refreshToken(String refreshToken) async {
    final response = await remoteDataSource.refreshToken(refreshToken);
    return AuthMapper.fromJson(response);
  }

  @override
  Future<void> forgetPassword(String email) async => await remoteDataSource.forgetPassword(email);

  @override
  Future<void> resetPassword(String token, String newPassword) async =>
      await remoteDataSource.resetPassword(token, newPassword);

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async =>
      await remoteDataSource.changePassword(oldPassword, newPassword);
}
