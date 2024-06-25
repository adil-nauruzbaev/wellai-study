import '../../../shared/data/root_gateway/root_gateway.dart';
import '../../../shared/widgets/logger.dart';
import '../dto_notifications/notifications_response.dart';

class NotificationsApi {
  NotificationsApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<NotificationsDto>> getNotofication(
    int limit,
    int offset,
  ) async {
    final response = await api.gateway.general.get(
      '/notifications',
      queryParameters: {
        'limit': limit,
        'offset': offset,
        'order': '-createdAt',
      },
    );
    //TODO Удалить LOG в конце
    Log.w(response.realUri);

    final data = <NotificationsDto>[];

    for (final element in response.data['notification']) {
      data.add(NotificationsDto.fromJson(element));
    }

    return data;
  }

  Future<void> deleteNotification(int id) async {
    await api.gateway.general.delete(
      '/notifications/$id',
    );
  }
}
