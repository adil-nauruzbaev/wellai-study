part of 'bloc.dart';

abstract class StatesUsState {
  const StatesUsState();
}

class StatesUsLoading extends StatesUsState {}

class StatesUsError extends StatesUsState with EquatableMixin {
  StatesUsError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

class StatesUsData extends StatesUsState with EquatableMixin {
  StatesUsData({
    required this.data,
  });

  final List<String> data;

  @override
  List<Object> get props => [data];
}
