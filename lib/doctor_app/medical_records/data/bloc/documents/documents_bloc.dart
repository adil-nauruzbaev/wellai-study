import '../../dto/categories_model.dart';
import '../../dto/documents_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/errors_getter.dart';
import '../../api/documents_api.dart';
part 'events.dart';
part 'states.dart';

class DocumentsDocBloc extends Bloc<DocumentsEvent, DocumentsState> {
  DocumentsDocBloc(this.api) : super(DocumentsInitial()) {
    on<DocumentsFetch>((event, emit) async {
      try {
        emit(DocumentsLoading());
        final data = await api.getDocuments(
          event.sort,
          event.start,
          event.end,
          event.categories,
        );
        emit(DocumentsData(data: data));
      } catch (error) {
        emit(DocumentsError(error: errorToString(error)));
        print(error);
      }
    });
    on<DocumentsDelete>(
      (event, emit) async {
        try {
          emit(DocumentsLoading());
          await api.deleteDocument(event.id);
          final data = await api.getDocuments(
            event.sort,
            event.start,
            event.end,
            event.categories,
          );
          emit(DocumentsData(data: data));
        } catch (error) {
          emit(DocumentsError(error: errorToString(error)));
        }
      },
    );
  }
  final DocumentsApi api;
}
