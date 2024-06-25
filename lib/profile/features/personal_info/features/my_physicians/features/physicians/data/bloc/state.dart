part of 'bloc.dart';

sealed class PhysiciansState {
  const PhysiciansState({required this.physicians});
  final List<PhysiciansDTO> physicians;
}

class PhysiciansError extends PhysiciansState with EquatableMixin {
  PhysiciansError({
    required this.error,
    required super.physicians,
  });
  final String error;

  @override
  List<Object> get props => [error];
}

class PhysiciansInitial extends PhysiciansState {
  PhysiciansInitial({required super.physicians});
}

class PhysiciansLoading extends PhysiciansState {
  PhysiciansLoading({required super.physicians});
}

class PhysiciansData extends PhysiciansState {
  PhysiciansData({required super.physicians});
}

class PhysiciansPatchSuccesc extends PhysiciansState {
  PhysiciansPatchSuccesc({required super.physicians});
}
