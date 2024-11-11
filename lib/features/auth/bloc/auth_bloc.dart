import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../domain/usecases/auth_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase auth;

  AuthBloc({
    required this.auth,
  }) : super(AuthInitial()) {
    on<SignInWithEmailEvent>(_onSignInWithEmail);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignInWithAppleEvent>(_onSignInWithApple);
  }

  Future<void> _onSignInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await auth.signInWithEmail.call(event.email, event.password);
    if (result != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Sign-In failed"));
    }
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await auth.signInWithGoogle();
    if (result != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Google Sign-In failed"));
    }
  }

  Future<void> _onSignInWithApple(
      SignInWithAppleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await auth.signInWithApple();
    if (result != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Apple Sign-In failed"));
    }
  }
}
