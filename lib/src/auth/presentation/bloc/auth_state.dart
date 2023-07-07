part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginState extends AuthState {
  final LoginRequest data;

  const LoginState({required this.data});
}

class RegisterState extends AuthState {}

class LoginLoadingState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class ErrorValidationState extends AuthState {}
