part of 'notifications_bloc.dart';

abstract class NotificationsState {
  const NotificationsState({
    required this.notifications,
  });

  final List<NotificationsDto> notifications;
}

class NotificationsInitial extends NotificationsState {
  NotificationsInitial({
    required super.notifications,
  });
}

class NotificationsError extends NotificationsState with EquatableMixin {
  NotificationsError({
    required this.error,
    required super.notifications,
  });
  final String error;
  @override
  List<Object> get props => [error];
}

class NotificationsLoading extends NotificationsState {
  NotificationsLoading({
    required super.notifications,
  });
}

class NotificationsData extends NotificationsState {
  NotificationsData({
    required super.notifications,
  });
}

class NotifPagginationLoading extends NotificationsState {
  NotifPagginationLoading({
    required super.notifications,
  });
}
