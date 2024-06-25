import '../../../profile/features/medical_records/data/dto/documents_dto.dart';
import '../../data/root_gateway/root_gateway.dart';

class DocCategoriesApi {
  DocCategoriesApi({
    required this.api,
  });
  final RootGateway api;

  Future<List<CategoryDto>> getCategories() async {
    final response = await api.gateway.general.get(
      '/document-categories',
    );

    final data = <CategoryDto>[];

    for (final element in response.data['documentcategories']) {
      data.add(CategoryDto.fromJson(element));
    }

    return data;
  }
}
