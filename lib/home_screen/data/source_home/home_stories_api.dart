import '../../../shared/data/root_gateway/root_gateway.dart';
import '../dto_home/stories_response.dart';

class StoriesApi {
  StoriesApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<StoriesResponseDto>> getStories() async {
    final response = await api.gateway.general.get(
      '/stories?include=image,thumbnail&order=order+',
    );

    final data = <StoriesResponseDto>[];

    for (final element in response.data['stories']) {
      data.add(StoriesResponseDto.fromJson(element));
    }

    return data;
  }
}
