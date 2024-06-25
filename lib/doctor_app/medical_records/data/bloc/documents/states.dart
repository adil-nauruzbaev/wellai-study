part of 'documents_bloc.dart';

abstract class DocumentsState {}

class DocumentsInitial extends DocumentsState {}

class DocumentsLoading extends DocumentsState {}

class DocumentsError extends DocumentsState {
  DocumentsError({required this.error});
  final String? error;
}

class DocumentsData extends DocumentsState {
  DocumentsData({required this.data});
  final List<DocumentsModel> data;
}
