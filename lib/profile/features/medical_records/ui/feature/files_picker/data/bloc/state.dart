part of 'bloc.dart';

sealed class FilesPickerState {}

class FilesPickerError extends FilesPickerState with EquatableMixin {
  FilesPickerError({
    required this.error,
  });
  final String error;

  @override
  List<Object> get props => [error];
}

final class FilesPickerInitial extends FilesPickerState {}

final class FilesPickerLoading extends FilesPickerState {}

class FilesPickerUploud extends FilesPickerState {}

class FilesPickerSucces extends FilesPickerState {}
