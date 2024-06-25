import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/errors_getter.dart';
import '../dto_history/history_notification.dart';
import '../source/history_api.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.historyApi}) : super(HistoryInitial(history: [])) {
    on<FetchHistory>(_getHistory);
    // on<DeleteNotification>(_deleteNotification);
    on<ReadNextHistory>(_readNextHistory);
  }
  final HistoryApi historyApi;

//TODO Проверить цифры
  int limit = 10;
  int offset = 0;

  Future<void> _getHistory(
    FetchHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      emit(HistoryLoading(history: []));
      limit = 10;
      offset = 0;
      final history = await historyApi.getHistory(limit, offset);
      emit(HistoryData(history: history));
    } catch (error) {
      emit(
        HistoryError(
          error: errorToString(error),
          history: state.history,
        ),
      );
      rethrow;
    }
  }

  Future<void> _readNextHistory(
    ReadNextHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      if (state is HistoryData) {
        final data = (state as HistoryData).history;
        emit(HistoryPaginationLoading(history: state.history));
        limit = limit + 1;
        offset = offset + 10;
        final history = await historyApi.getHistory(limit, offset);
        emit(HistoryData(history: [...data, ...history]));
      }
    } catch (error) {
      emit(
        HistoryError(
          error: errorToString(error),
          history: state.history,
        ),
      );
      rethrow;
    }
  }
}
