import '../../../shared/data/root_gateway/root_gateway.dart';
import 'dto_home/news_model.dart';

class NewsDoctorApi {
  NewsDoctorApi({required this.api});
  final RootGateway api;

  Future<List<NewsModel>> getNews() async {
    final response = await api.gateway.general.get('/news?include=image');
    final results = <NewsModel>[];
    for (final element in response.data['news']) {
      results.add(NewsModel.fromJson(element));
    }
    return results;
  }
}
