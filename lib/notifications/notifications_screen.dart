import 'package:flutter/material.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import 'ui/feature/notifications_list/notification_list.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
          child: Text(
            context.s.notifications,
            style: context.text.m24w400,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: context.color.background,
      ),
      body: const NotificationList(),
    );
  }
}
