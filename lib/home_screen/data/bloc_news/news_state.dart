part of 'news_bloc.dart';

abstract class NewsState {
  const NewsState();
}

class NewsError extends NewsState with EquatableMixin {
  NewsError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsData extends NewsState {
  NewsData(this.news);
  final List<NewsResponseDto> news;
}
