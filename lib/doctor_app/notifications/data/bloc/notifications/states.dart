part of 'notifications_bloc.dart';

abstract class NotificationsDocState {}

class NotificationsInitial extends NotificationsDocState {}

class NotificationsLoading extends NotificationsDocState {}

class NotificationsError extends NotificationsDocState {
  NotificationsError({required this.error});
  final String error;
}

class NotificationsData extends NotificationsDocState {
  NotificationsData({required this.data});
  final List<NotificationModel> data;
}
