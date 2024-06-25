part of 'bloc.dart';

class FilesPickerEvent {}

class EditDocument extends FilesPickerEvent {}

class CreateDocument extends FilesPickerEvent {
  CreateDocument(this.postDocumentsDto);
  final PostDocumentsDto postDocumentsDto;
}

class DocumentSave extends FilesPickerEvent {}
