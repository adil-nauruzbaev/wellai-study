part of 'history_bloc.dart';

abstract class HistoryState {
  const HistoryState({
    required this.history,
  });

  final List<HistoryDto> history;
}

class HistoryInitial extends HistoryState {
  HistoryInitial({
    required super.history,
  });
}

class HistoryError extends HistoryState with EquatableMixin {
  HistoryError({
    required this.error,
    required super.history,
  });
  final String error;
  @override
  List<Object> get props => [error];
}

class HistoryLoading extends HistoryState {
  HistoryLoading({
    required super.history,
  });
}

class HistoryData extends HistoryState {
  HistoryData({
    required super.history,
  });
}

class HistoryPaginationLoading extends HistoryState {
  HistoryPaginationLoading({
    required super.history,
  });
}
