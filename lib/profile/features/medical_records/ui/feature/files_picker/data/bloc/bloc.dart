import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../shared/errors_getter.dart';
import '../post_documents_api.dart';
import '../post_documents_dto.dart';

part 'event.dart';
part 'state.dart';

class FilesPickerBloc extends Bloc<FilesPickerEvent, FilesPickerState> {
  FilesPickerBloc(this.postDocumentsApi) : super(FilesPickerInitial()) {
    on<CreateDocument>(_postDocument);
  }
  final PostDocumentsApi postDocumentsApi;
  Future<void> _postDocument(
    CreateDocument event,
    Emitter<FilesPickerState> emit,
  ) async {
    try {
      emit(FilesPickerLoading());
      await postDocumentsApi.postDocuments(event.postDocumentsDto);
      emit(FilesPickerSucces());
    } catch (error) {
      emit(
        FilesPickerError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
