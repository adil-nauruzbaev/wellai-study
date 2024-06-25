import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../shared/errors_getter.dart';

import '../calendar_api.dart';
import '../dto/work_time.dart';
part 'events.dart';
part 'states.dart';

class CalendarDocBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarDocBloc(this.calendarApi) : super(CalendarInitial()) {
    on<CalendarFetchEvent>(
      (event, emit) async {
        try {
          // ignore: unused_local_variable
          var index = 0;
          emit(CalendarLoading());
          final startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
          final endDate = DateFormat('yyyy-MM-dd')
              .format(DateTime.now().add(const Duration(days: 14)));
          final data = await calendarApi.getWorks(startDate, endDate);
          Map<String, List<WorkTime>> groupedDate = {};
          for (final element in data) {
            var date = element.work?.date.toString() ?? '';
            date = date.substring(0, 10);
            if (!groupedDate.containsKey(date)) {
              groupedDate[date] = [];
            }
            groupedDate[date]?.add(element);
          }
          groupedDate.forEach((date, worktime) {
            worktime.sort(
              (a, b) {
                return (a.time != null && b.time != null)
                    ? a.time!.compareTo(b.time!)
                    : 0;
              },
            );
            index++;
          });
          emit(CalendarData(data: groupedDate));
        } catch (error) {
          emit(CalendarError(error: errorToString(error)));
        }
      },
    );
  }

  final CalendarDocApi calendarApi;
}
