import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/errors_getter.dart';
import '../../dto/documents_dto.dart';
import '../../dto/filter.dart';
import '../../source/documents_model_api.dart';
part 'event.dart';
part 'state.dart';

class DocumentlBloc extends Bloc<DocumenlEvent, DocumentState> {
  DocumentlBloc(this.documentsApi)
      : super(
          DocumentInitial(
            documents: [],
          ),
        ) {
    on<FetchDocument>(_getDocuments);
    on<DeleteDocument>(_deleteDocument);
  }
  final DocumentsModelApi documentsApi;

  Future<void> _getDocuments(
    FetchDocument event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(DocumentLoading(documents: []));
      final documents = await documentsApi.getDocuments(event.filter);
      emit(DocumentData(documents: documents));
    } catch (error) {
      emit(
        DocumentError(
          error: errorToString(error),
          documents: state.documents,
        ),
      );
      rethrow;
    }
  }

  Future<void> _deleteDocument(
    DeleteDocument event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(
        DocumentLoading(documents: state.documents),
      );
      await documentsApi.deleteDocuments(event.id);
      final documents = await documentsApi.getDocuments(event.filter);
      emit(DocumentData(documents: documents));
    } catch (error) {
      emit(
        DocumentError(
          error: errorToString(error),
          documents: state.documents,
        ),
      );
    }
  }
}
