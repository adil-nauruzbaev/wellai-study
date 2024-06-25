part of 'stories_bloc.dart';

sealed class StoriesState {
  const StoriesState();
}

class StoriesError extends StoriesState with EquatableMixin {
  StoriesError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}

final class StoriesInitial extends StoriesState {}

class StoriesLoading extends StoriesState {}

class StoriesData extends StoriesState {
  StoriesData(this.stories);
  final List<StoriesResponseDto> stories;
}
