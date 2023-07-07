part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginRequest request;

  const LoginEvent({required this.request});

  @override
  List<Object> get props => [request];
}

class RegisterEvent extends AuthEvent {
  final RegisterRequest request;

  const RegisterEvent({required this.request});

  @override
  List<Object> get props => [request];
}
