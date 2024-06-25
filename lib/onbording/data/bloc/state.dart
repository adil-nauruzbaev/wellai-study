part of 'bloc.dart';

abstract class InitialState {
  const InitialState();
}

class InitialAuth extends InitialState {
  InitialAuth({
    required this.token,
    required this.role,
  });

  final String token;
  final String role;
}

class InitialUnauth extends InitialState {}

class InitialLoading extends InitialState {}
