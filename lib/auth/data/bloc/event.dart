part of 'bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthSignIn extends AuthEvent {
  AuthSignIn({
    required this.login,
    required this.pass,
    required this.isDoctor,
  });

  final String login;
  final String pass;
  final bool isDoctor;
}

class AuthReset extends AuthEvent {}
