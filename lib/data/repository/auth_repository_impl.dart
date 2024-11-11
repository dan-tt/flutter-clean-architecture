import '../../domain/entities/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> signInWithEmail(String email, String password) async {
    final userModel = await remoteDataSource.signInWithEmail(email, password);
    return userModel;
  }

  @override
  Future<User?> signInWithGoogle() {
    return remoteDataSource.signInWithGoogle();
  }

  @override
  Future<User?> signInWithApple() {
    return remoteDataSource.signInWithApple();
  }
}
