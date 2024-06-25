import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/errors_getter.dart';
import '../dto_notifications/notifications_response.dart';
import '../source_notifications/notifications_api.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required this.notificationsApi})
      : super(
          NotificationsInitial(
            notifications: [],
          ),
        ) {
    on<FetchNotifications>(_getNotifications);
    on<DeleteNotification>(_deleteNotification);
    on<ReadNext>(_readNext);
  }
  final NotificationsApi notificationsApi;

  //TODO Проверить цифры
  int limit = 10;
  int offset = 0;

  Future<void> _getNotifications(
    FetchNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(NotificationsLoading(notifications: []));
      limit = 10;
      offset = 0;
      final notifications =
          await notificationsApi.getNotofication(limit, offset);
      emit(NotificationsData(notifications: notifications));
    } catch (error) {
      emit(
        NotificationsError(
          error: errorToString(error),
          notifications: state.notifications,
        ),
      );
      rethrow;
    }
  }

  Future<void> _readNext(
    ReadNext event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      if (state is NotificationsData) {
        final data = (state as NotificationsData).notifications;

        emit(NotifPagginationLoading(notifications: state.notifications));

        //TODO Проверить верно ли
        limit = limit + 1;
        offset = offset + 10;
        final notifications =
            await notificationsApi.getNotofication(limit, offset);

        emit(NotificationsData(notifications: [...data, ...notifications]));
      }
    } catch (error) {
      emit(
        NotificationsError(
          error: errorToString(error),
          notifications: state.notifications,
        ),
      );
      rethrow;
    }
  }

  Future<void> _deleteNotification(
    DeleteNotification event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(
        NotificationsLoading(notifications: state.notifications),
      );
      await notificationsApi.deleteNotification(event.id);
      final notifications = await notificationsApi.getNotofication(1, 10);
      emit(NotificationsData(notifications: notifications));
    } catch (error) {
      emit(
        NotificationsError(
          error: errorToString(error),
          notifications: state.notifications,
        ),
      );
    }
  }
}
