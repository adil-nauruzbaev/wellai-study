import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/errors_getter.dart';
import '../work_th_api.dart';
import '../work_th_dto.dart';

part 'state.dart';
part 'event.dart';

class WorkThBloc extends Bloc<WorkThEvent, WorkThState> {
  WorkThBloc(this.workThApi) : super(WorkThInitial()) {
    on<FetchData>(_postWork);
  }
  final WorkThApi workThApi;

  Future<void> _postWork(
    FetchData event,
    Emitter<WorkThState> emit,
  ) async {
    try {
      emit(WorkThLoading());
      final now = DateTime.now();
      final start = DateTime(now.year, now.month, now.day);
      final end = start.add(const Duration(days: 13));

      // Конвертация дат в строки в формате "YYYY-MM-DD"
      //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      final String formattedStart =
          "${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}";
      final String formattedEnd =
          "${end.year}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}";

      final response = await workThApi.postWork(formattedStart, formattedEnd);

      if (response.worktime != null && response.worktime!.isNotEmpty) {
        final groupedByDate = groupBy(response.worktime!, (WorkTimeDTO wt) => wt.work?.date);

        final Map<String?, List<WorkTimeDTO>> sortedAndGroupedWorktimes = groupedByDate.map(
          (date, worktimes) {
            final sortedWorktimes = worktimes
              ..sort(
                (a, b) => a.time!.compareTo(b.time!),
              );
            return MapEntry(date, sortedWorktimes);
          },
        );

        emit(
          WorkThSuccess(sortedAndGroupedWorktimes: sortedAndGroupedWorktimes, count: response.count),
        );
      } else {
        emit(
          WorkThSuccess(
            sortedAndGroupedWorktimes: {},
            count: response.count,
          ),
        );
      }
    } catch (error) {
      emit(WorkThError(error: errorToString(error)));
    }
  }
}
