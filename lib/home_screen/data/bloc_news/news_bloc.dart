import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/errors_getter.dart';
import '../dto_home/news_response.dart';
import '../source_home/home_news_api.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsApi) : super(NewsInitial()) {
    on<FetchNews>(_getNews);
  }
  final NewsApi newsApi;

  Future<void> _getNews(
    FetchNews event,
    Emitter<NewsState> emit,
  ) async {
    try {
      emit(NewsLoading());
      final news = await newsApi.getNews();
      emit(NewsData(news));
    } catch (error) {
      emit(
        NewsError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
