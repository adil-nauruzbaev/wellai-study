part of 'notifications_bloc.dart';

abstract class NotificationDocEvent {}

class FetchNotifications extends NotificationDocEvent {}

class DeleteNotifications extends NotificationDocEvent {
  DeleteNotifications({required this.id});
  final int id;
}

class NextNotifications extends NotificationDocEvent {}

class ReadNotifications extends NotificationDocEvent {
  ReadNotifications({required this.id});
  final int id;
}
