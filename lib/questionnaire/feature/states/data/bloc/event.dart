part of 'bloc.dart';

abstract class StatesUsEvent {
  const StatesUsEvent();
}

class StatesUsFetch extends StatesUsEvent {
  const StatesUsFetch();
}

class StateSearch extends StatesUsEvent {
  StateSearch({
    required this.query,
  });

  final String query;
}
