// domain/usecases/auth/sign_up_user_usecase.dart
import 'package:eotc_melodies/shared/models/user_model.dart';

import '../repositories/auth_repository.dart';
import '../entities/auth_entity.dart';

class SignUpUserUseCase {
  final AuthRepository repository;

  SignUpUserUseCase(this.repository);

  Future<AuthEntity> execute({
    required String name,
    required String email,
    required String password, required Map<String, dynamic> params, required UserModel user,
  }) async {
    return await repository.signUpUser(name: name, email: email, password: password);
  }
}
