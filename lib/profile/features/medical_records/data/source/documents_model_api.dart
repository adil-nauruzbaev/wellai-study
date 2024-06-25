import '../../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../../shared/widgets/logger.dart';
import '../dto/documents_dto.dart';
import '../dto/filter.dart';

class DocumentsModelApi {
  DocumentsModelApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<DocumentResponceDto>> getDocuments(
    FilterDTO filter,
  ) async {
    final params = [];
    for (final element in filter.categories ?? <CategoryDto>[]) {
      params.add('${element.id}');
    }

    final response = await api.gateway.general.get(
      '/documents?include=user.profile.image,files,category',
      queryParameters: {
        'order': filter.sort != true ? 'dateOfEvent' : '-dateOfEvent',
        if (params.isNotEmpty) 'category__in': params.join(','),
        if (filter.dataFrom != null) 'dateOfEvent__gte': '${filter.dataFrom?.toIso8601String()}',
        if (filter.dataTo != null) 'dateOfEvent__lte': '${filter.dataTo?.toIso8601String()}',
      },
    );
    Log.w(response.verbose);
    final data = <DocumentResponceDto>[];

    for (final elemnt in response.data['document']) {
      data.add(DocumentResponceDto.fromJson(elemnt));
    }
    return data;
  }

  Future<void> deleteDocuments(int id) async {
    await api.gateway.general.delete('/documents/$id');
  }
}
