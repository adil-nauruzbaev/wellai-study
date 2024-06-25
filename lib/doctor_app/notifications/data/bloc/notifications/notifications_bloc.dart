import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dto/notifications_model.dart';
import '../../notifications_api.dart';

import '../../../../../shared/errors_getter.dart';
part 'events.dart';
part 'states.dart';

class NotificationsDocBloc
    extends Bloc<NotificationDocEvent, NotificationsDocState> {
  NotificationsDocBloc(this.api) : super(NotificationsInitial()) {
    on<FetchNotifications>(
      (event, emit) async {
        try {
          emit(NotificationsLoading());
          final notifications = await api.getNotifications();
          emit(NotificationsData(data: notifications));
        } catch (error) {
          emit(NotificationsError(error: errorToString(error)));

          rethrow;
        }
      },
    );

    on<DeleteNotifications>(
      (event, emit) async {
        try {
          emit(NotificationsLoading());
          await api.deleteNotification(event.id);
          final notifications = await api.getNotifications();
          emit(NotificationsData(data: notifications));
        } catch (error) {
          emit(NotificationsError(error: errorToString(error)));

          rethrow;
        }
      },
    );
    on<ReadNotifications>(
      (event, emit) async {
        try {
          await api.readNotification(event.id);
          final notifications = await api.getNotifications();
          emit(NotificationsData(data: notifications));
        } catch (error) {
          emit(NotificationsError(error: errorToString(error)));
        }
      },
    );
  }

  final NotificationsDocApi api;
}
