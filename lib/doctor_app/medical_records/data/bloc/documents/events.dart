part of 'documents_bloc.dart';

abstract class DocumentsEvent {}

class DocumentsFetch extends DocumentsEvent {
  DocumentsFetch({
    required this.sort,
    required this.categories,
    this.end,
    this.start,
  });
  final int sort;
  final DateTime? start;
  final DateTime? end;
  final List<CategoriesModel> categories;
}

class DocumentsDelete extends DocumentsEvent {
  DocumentsDelete(
      {required this.id,
      required this.sort,
      required this.categories,
      this.end,
      this.start});
  final int id;
  final int sort;
  final DateTime? start;
  final DateTime? end;
  final List<CategoriesModel> categories;
}
