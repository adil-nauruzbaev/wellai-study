import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/notifications/notifications_bloc.dart';
import 'widgets/notifications_empty.dart';
import 'widgets/notifications_list.dart';

class NotificationsDocScreen extends StatefulWidget {
  const NotificationsDocScreen({super.key});

  @override
  State<NotificationsDocScreen> createState() => _NotificationsDocScreenState();
}

class _NotificationsDocScreenState extends State<NotificationsDocScreen> {
  bool appbar = false;
  @override
  void initState() {
    super.initState();
    CoreDi.get<NotificationsDocBloc>().add(FetchNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.color.textPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          context.s.notifications,
          style: context.text.s24w700.copyWith(
            color: context.color.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        backgroundColor: context.color.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          BlocBuilder(
            bloc: CoreDi.get<NotificationsDocBloc>(),
            builder: (context, state) {
              if (state is NotificationsData) {
                if (state.data.isEmpty) {
                  return const SizedBox.shrink();
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        context.s.clearAll,
                        style: context.text.s16w600
                            .copyWith(color: context.color.buttonGreen),
                      ),
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: CoreDi.get<NotificationsDocBloc>(),
        builder: (context, state) {
          if (state is NotificationsInitial) {
            return const SizedBox.shrink();
          }
          if (state is NotificationsLoading) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            );
          }
          if (state is NotificationsError) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.s.errorLoadingNotifications),
              ],
            );
          }
          if (state is NotificationsData) {
            final notiList = state.data;
            if (notiList.isEmpty) {
              appbar = false;
              return const NotificationsEmpty();
            } else {
              appbar = true;
              return NotificationsList(notiList: notiList);
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
