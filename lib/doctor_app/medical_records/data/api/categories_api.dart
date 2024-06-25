import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../dto/categories_model.dart';

class CategoriesApi {
  CategoriesApi({required this.api});

  Future<List<CategoriesModel>> getCategories() async {
    final response = await api.gateway.general.get('/document-categories');
    final results = <CategoriesModel>[];
    for (final element in response.data['documentcategories']) {
      results.add(CategoriesModel.fromJson(element));
    }
    return results;
  }

  final RootGateway api;
}
