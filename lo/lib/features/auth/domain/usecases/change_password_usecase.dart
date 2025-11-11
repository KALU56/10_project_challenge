// domain/usecases/auth/change_password_usecase.dart
import '../repositories/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<void> execute({required String oldPassword, required String newPassword}) async {
    return await repository.changePassword(oldPassword, newPassword);
  }
}
