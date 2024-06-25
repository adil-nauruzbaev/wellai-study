//import 'package:arch/doctor_app/home/data/dto_home/news.dart';
part of 'news_bloc.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  NewsError({required this.error});
  final String error;
}

class NewsData extends NewsState {
  NewsData({required this.data});
  final List<NewsModel> data;
}
