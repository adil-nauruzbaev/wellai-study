part of 'bloc.dart';

abstract class PharmaciesState {
  const PharmaciesState();
}

class PharmaciesLoading extends PharmaciesState {}

class PharmaciesError extends PharmaciesState with EquatableMixin {
  PharmaciesError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

class PharmaciesData extends PharmaciesState with EquatableMixin {
  PharmaciesData({
    required this.data,
  });

  final List<String> data;

  @override
  List<Object> get props => [data];
}
