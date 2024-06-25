part of 'notifications_bloc.dart';

sealed class NotificationsEvent {}

class FetchNotifications extends NotificationsEvent {}

class DeleteNotification extends NotificationsEvent {
  DeleteNotification(this.id);
  final int id;
}

class ReadNext extends NotificationsEvent {}
