import '../../../shared/data/root_gateway/root_gateway.dart';
import 'dto/notifications_model.dart';

class NotificationsDocApi {
  NotificationsDocApi({required this.api});
  final RootGateway api;
  Future<List<NotificationModel>> getNotifications() async {
    final response = await api.gateway.general.get(
      'notifications?include=notificationsMessage.message.chat.session,notificationsAppointment.appointment.user.profile,notificationsAppointment.appointment.workTime.work.user.profile,notificationsNote.session.user.profile,notificationsAppointment.appointment.session.note,notificationsAgreement,notificationsTelehealth&order=-createdAt',
    );
    final result = <NotificationModel>[];
    for (final element in response.data['notification']) {
      result.add(NotificationModel.fromJson(element));
    }

    return result;
  }

  Future deleteNotification(int id) async {
    await api.gateway.general.delete('/notifications/$id');
  }

  Future readNotification(int id) async {
    await api.gateway.general.post('/notifications/read/$id');
  }
}
