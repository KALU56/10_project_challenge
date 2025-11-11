// domain/usecases/auth/refresh_token_usecase.dart
import '../repositories/auth_repository.dart';
import '../entities/auth_entity.dart';

class RefreshTokenUseCase {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  Future<AuthEntity> execute(String refreshToken) async {
    return await repository.refreshToken(refreshToken);
  }
}
