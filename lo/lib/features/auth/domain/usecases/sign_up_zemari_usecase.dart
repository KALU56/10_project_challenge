// domain/usecases/auth/sign_up_zemari_usecase.dart
import 'package:eotc_melodies/shared/models/user_model.dart';
import 'package:eotc_melodies/shared/models/zemari_profile_model.dart';

import '../repositories/auth_repository.dart';
import '../entities/auth_entity.dart';

class SignUpZemariUseCase {
  final AuthRepository repository;

  SignUpZemariUseCase(this.repository);

  Future<AuthEntity> execute({
    required String name,
    required String email,
    required String password,
    required ZemariProfileModel zemariProfile, required Map<String, dynamic> params, required UserModel user,
  }) async {
    return await repository.signUpZemari(
      name: name,
      email: email,
      password: password,
      zemariProfile: zemariProfile,
    );
  }
}
