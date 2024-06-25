import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'notifications_element.dart';
import '../empty_notif.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../data/bloc/notifications_bloc.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<NotificationsBloc>().add(FetchNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      bloc: CoreDi.get<NotificationsBloc>(),
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NotificationsError) {
          return Center(
            child: Text(context.s.errorLoadingNotifications),
          );
        }

        if (state.notifications.isEmpty) {
          return const NotificationsNull();
        }
        return NotificationListener(
          onNotification: (notif) {
            if (notif is ScrollNotification) {
              if (notif.metrics.extentAfter == 0) {
                CoreDi.get<NotificationsBloc>().add(ReadNext());
              }
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              CoreDi.get<NotificationsBloc>().add(FetchNotifications());
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('data')),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      final notificationsItem = state.notifications[index];
                      return NotificationElement(
                        notificationsItem: notificationsItem,
                      );
                    },
                  ),
                ),
                if (state is NotifPagginationLoading) const LinearProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
