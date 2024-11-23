import '../entities/user.dart';

abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithApple();
}
