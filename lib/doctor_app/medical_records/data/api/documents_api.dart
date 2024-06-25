import 'package:intl/intl.dart';

import '../../../../shared/data/root_gateway/root_gateway.dart';
import '../dto/categories_model.dart';
import '../dto/documents_model.dart';

class DocumentsApi {
  DocumentsApi({required this.api});
  Future<List<DocumentsModel>> getDocuments(
    int sort,
    DateTime? start,
    DateTime? end,
    List<CategoriesModel> categoriesList,
  ) async {
    var sortingResult = '';
    var startStr = '';
    var endStr = '';
    var categories = '';
    var firstList = '';
    categoriesList.forEach((element) {
      firstList = '$firstList${element.id},';
    });
    if (sort == 1) {
      sortingResult = '&order=dateOfEvent';
    } else if (sort == 2) {
      sortingResult = '&order=-dateOfEvent';
    }
    if (start != null) {
      startStr = '&dateOfEvent__gte=${DateFormat('yyyy-MM-dd').format(start)}';
    }
    if (end != null) {
      endStr = '&dateOfEvent__lte=${DateFormat('yyyy-MM-dd').format(end)}';
    }

    if (categoriesList.isNotEmpty) {
      firstList = firstList.substring(0, firstList.length - 1);
      categories = '&category__in=$firstList';
      print(categories);
    } else {
      categories = '';
    }
    final response = await api.gateway.general.get(
      '/documents?include=user.profile.image,files,category$startStr$endStr$sortingResult$categories',
    );
    print(
        '/documents?include=user.profile.image,files,category$startStr$endStr$sortingResult$categories');
    final results = <DocumentsModel>[];
    for (final element in response.data['document']) {
      results.add(DocumentsModel.fromJson(element));
    }
    return results;
  }

  Future<void> addDocument() async {
    //await api.gateway.general.post();
  }
  Future<void> deleteDocument(int id) async {
    await api.gateway.general.delete('/documents/$id');
  }

  final RootGateway api;
}
