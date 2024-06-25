part of 'bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthError extends AuthState with EquatableMixin {
  AuthError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess({
    required this.token,
  });

  final String token;
}

class AuthInitial extends AuthState {}
