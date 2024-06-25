import '../../../shared/data/root_gateway/root_gateway.dart';
import '../../../shared/widgets/logger.dart';
import '../dto_history/history_notification.dart';

class HistoryApi {
  HistoryApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<HistoryDto>> getHistory(
    int limit,
    int offset,
  ) async {
    final response = await api.gateway.general.get(
      '/session/finish',
      queryParameters: {
        'limit': limit,
        'offset': offset,
        'order': '-createdAt',
      },
    );
    //TODO Удалить LOG в конце
    Log.w(response.realUri);

    final data = <HistoryDto>[];
    for (final element in response.data['sessions']) {
      data.add(HistoryDto.fromJson(element));
    }
    return data;
  }
}
