part of 'bloc.dart';

abstract class QualifificationState {
  const QualifificationState();
}

class QualifificationError extends QualifificationState with EquatableMixin {
  QualifificationError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}

class QualifificationInitial extends QualifificationState {}

class QualifificationLoading extends QualifificationState {}

class QualifificationData extends QualifificationState {
  QualifificationData(this.qualifificationsBloc);
  final List<QualifificationDTO> qualifificationsBloc;
}
