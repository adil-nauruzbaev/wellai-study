import 'package:dio/dio.dart';

import '../../../../../../../shared/data/root_gateway/root_gateway.dart';
import 'post_documents_dto.dart';

class PostDocumentsApi {
  PostDocumentsApi({required this.api});
  final RootGateway api;

  Future<void> postDocuments(PostDocumentsDto postDocumentsDto) async {
    final fromData = FormData.fromMap(
      {
        ...postDocumentsDto.toJson(),
        'file': await MultipartFile.fromFile(
          postDocumentsDto.file ?? '',
        ),
      },
    );

    await api.gateway.general.post(
      '/documents',
      data: fromData,
    );
  }
}
