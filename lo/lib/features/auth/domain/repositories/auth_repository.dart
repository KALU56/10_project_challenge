// domain/repositories/auth_repository.dart
import 'package:eotc_melodies/shared/models/zemari_profile_model.dart';

import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> signIn(String email, String password);
  Future<AuthEntity> signUpUser({
    required String name,
    required String email,
    required String password,
  });
  Future<AuthEntity> signUpZemari({
    required String name,
    required String email,
    required String password,
    required ZemariProfileModel zemariProfile,
  });
  Future<void> signOut();
  Future<AuthEntity> getSession();
  Future<AuthEntity> refreshToken(String refreshToken);
  Future<void> forgetPassword(String email);
  Future<void> resetPassword(String token, String newPassword);
  Future<void> changePassword(String oldPassword, String newPassword);
}
