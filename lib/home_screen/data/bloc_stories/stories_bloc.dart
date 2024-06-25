import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/errors_getter.dart';
import '../dto_home/stories_response.dart';
import '../source_home/home_stories_api.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc(this.storiesApi) : super(StoriesInitial()) {
    on<FetchStories>(_getStories);
  }
  final StoriesApi storiesApi;

  Future<void> _getStories(
    FetchStories event,
    Emitter<StoriesState> emit,
  ) async {
    try {
      emit(StoriesLoading());
      final stories = await storiesApi.getStories();
      emit(StoriesData(stories));
    } catch (error) {
      emit(
        StoriesError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
