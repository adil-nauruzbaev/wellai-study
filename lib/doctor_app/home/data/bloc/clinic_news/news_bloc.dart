import '../../dto_home/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/errors_getter.dart';
import '../../news_api.dart';
part 'news_events.dart';
part 'news_states.dart';

class NewsDoctorBloc extends Bloc<NewsEvent, NewsState> {
  NewsDoctorBloc(this.newsApi) : super(NewsInitial()) {
    on<FetchNews>(
      (event, emit) async {
        try {
          emit(NewsLoading());
          final news = await newsApi.getNews();
          emit(NewsData(data: news));
        } catch (error) {
          emit(NewsError(error: errorToString(error)));
          rethrow;
        }
      },
    );
    on<NextNews>(
      (event, emit) async {
        emit(NewsLoading());
      },
    );
  }
  final NewsDoctorApi newsApi;
}
