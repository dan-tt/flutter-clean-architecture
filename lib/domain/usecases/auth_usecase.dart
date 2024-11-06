
import '../entities/user.dart';
import '../repository/auth_repository.dart';

abstract class AuthUseCase {
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithApple();
}

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository repository;

  AuthUseCaseImpl({required this.repository});

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    return await repository.signInWithEmail(email, password);
  }

  @override
  Future<User?> signInWithGoogle() {
    return repository.signInWithGoogle();
  }

  @override
  Future<User?> signInWithApple() {
    return repository.signInWithApple();
  }
}