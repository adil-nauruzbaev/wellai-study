import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/features/medical_records/data/dto/documents_dto.dart';
import '../../errors_getter.dart';
import '../source_doc_categories/api_doc.dart';

part 'event.dart';
part 'state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this.docCategoriesApi) : super(CategoriesInitial()) {
    on<FetchCategories>(_getDocCategories);
  }
  final DocCategoriesApi docCategoriesApi;

  Future<void> _getDocCategories(
    FetchCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      emit(CategoriesLoading());
      final docCategories = await docCategoriesApi.getCategories();
      emit(CategoriesData(docCategories));
    } catch (error) {
      emit(
        CategoriesError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
