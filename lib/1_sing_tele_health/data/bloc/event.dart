part of 'bloc.dart';

abstract class WorkThEvent {
  const WorkThEvent();
}

class FetchData extends WorkThEvent {
  FetchData({
    required this.start,
    required this.end,
  });

  final String start;
  final String end;
}

class DateSelected extends WorkThEvent {
  DateSelected(this.selectedDate);
  final String selectedDate;
}
