part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthSignIN extends AuthState {}

final class AuthSignUp extends AuthState {}

final class AuthEnterPhone extends AuthState {}

final class AuthEnterOTP extends AuthState {}

final class AuthSeccess extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
