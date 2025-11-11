// domain/usecases/auth/sign_in_usecase.dart
import '../repositories/auth_repository.dart';
import '../entities/auth_entity.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<AuthEntity> execute({required String email, required String password}) async {
    return await repository.signIn(email, password);
  }
}
