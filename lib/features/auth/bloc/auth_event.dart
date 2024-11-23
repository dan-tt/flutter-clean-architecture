import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithAppleEvent extends AuthEvent {}

class SignUpWithEmailEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpWithEmailEvent({required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}