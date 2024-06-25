import '../../../shared/data/root_gateway/root_gateway.dart';
import '../dto_home/news_response.dart';

class NewsApi {
  NewsApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<NewsResponseDto>> getNews() async {
    final response = await api.gateway.general.get(
      '/news?include=image',
    );

    final data = <NewsResponseDto>[];

    for (final element in response.data['news']) {
      data.add(NewsResponseDto.fromJson(element));
    }

    return data;
  }
}
