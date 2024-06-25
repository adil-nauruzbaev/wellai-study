part of 'news_bloc.dart';

abstract class NewsEvent {}

class FetchNews extends NewsEvent {}

class NextNews extends NewsEvent {}
