part of 'bloc.dart';

abstract class DocumenlEvent {}

class DeleteDocument extends DocumenlEvent {
  DeleteDocument(this.id, this.filter);
  final FilterDTO filter;
  final int id;
}

class FetchDocument extends DocumenlEvent {
  FetchDocument(this.filter);
  final FilterDTO filter;
}
