part of 'bloc.dart';

abstract class WorkThState {
  const WorkThState();
}

class WorkThInitial extends WorkThState {}

class WorkThError extends WorkThState with EquatableMixin {
  WorkThError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [error];
}

class WorkThLoading extends WorkThState {}

class WorkThSuccess extends WorkThState {
  WorkThSuccess({
    required this.sortedAndGroupedWorktimes,
    this.count,
  });
  final Map<String?, List<WorkTimeDTO>> sortedAndGroupedWorktimes;
  final int? count;
}

class WorkThNoData extends WorkThState {
  WorkThNoData({required this.selectedDate});
  final String selectedDate;
}
