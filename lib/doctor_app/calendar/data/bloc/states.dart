part of 'calendar_bloc.dart';

abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarError extends CalendarState {
  CalendarError({required this.error});
  final String error;
}

class CalendarData extends CalendarState {
  CalendarData({required this.data});
  final Map<String, List<WorkTime>> data;
}
