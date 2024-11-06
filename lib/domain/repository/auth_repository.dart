import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithApple();
}
