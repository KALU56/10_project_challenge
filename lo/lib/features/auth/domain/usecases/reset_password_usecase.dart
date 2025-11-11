// domain/usecases/auth/reset_password_usecase.dart
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<void> execute({required String token, required String newPassword}) async {
    return await repository.resetPassword(token, newPassword);
  }
}
