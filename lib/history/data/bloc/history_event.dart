part of 'history_bloc.dart';

sealed class HistoryEvent {}

class FetchHistory extends HistoryEvent {}

class ReadNextHistory extends HistoryEvent {}
