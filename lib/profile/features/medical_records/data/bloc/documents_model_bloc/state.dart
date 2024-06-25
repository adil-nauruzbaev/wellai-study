part of 'bloc.dart';

sealed class DocumentState {
  const DocumentState({required this.documents});
  final List<DocumentResponceDto> documents;
}

class DocumentError extends DocumentState with EquatableMixin {
  DocumentError({
    required this.error,
    required super.documents,
  });
  final String error;

  @override
  List<Object> get props => [error];
}

final class DocumentInitial extends DocumentState {
  DocumentInitial({required super.documents});
}

class DocumentLoading extends DocumentState {
  DocumentLoading({required super.documents});
}

class DocumentData extends DocumentState {
  DocumentData({required super.documents});
  // final List<DocumentsRespomceDto> documents;
}
