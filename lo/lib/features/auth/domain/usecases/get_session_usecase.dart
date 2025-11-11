// domain/usecases/auth/get_session_usecase.dart
import '../repositories/auth_repository.dart';
import '../entities/auth_entity.dart';

class GetSessionUseCase {
  final AuthRepository repository;

  GetSessionUseCase(this.repository);

  Future<AuthEntity> execute() async {
    return await repository.getSession();
  }
}
