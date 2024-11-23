import 'package:flutter_application_1/data/network/network_service.dart';
import 'package:flutter_application_1/domain/usecases/auth_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/datasource/auth_remote_datasource.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../features/auth/bloc/auth_bloc.dart';

// Initialize GetIt
final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Use Cases
  sl.registerLazySingleton<AuthUseCase>(
    () => AuthUseCaseImpl(repository: sl()),
  );

  // Bloc
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(auth: sl<AuthUseCase>()),
    );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Service
  sl.registerLazySingleton<NetworkService>(
    () => NetworkService(),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(networkService: sl()),
  );

  // External Libraries
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
}
