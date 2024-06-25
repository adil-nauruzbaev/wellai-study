import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/app_assets.dart';
// import '../../shared/data/root_gateway/root_gateway.dart';
// import '../../shared/l10n/source/local_storage.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../data/bloc/notifications_bloc.dart';
import '../../../data/dto_notifications/notifications_response.dart';
import '../alert/alert_delete.dart';

class NotificationElement extends StatefulWidget {
  const NotificationElement({required this.notificationsItem, super.key});
  final NotificationsDto notificationsItem;

  @override
  State<NotificationElement> createState() => _NotificationElementState();
}

class _NotificationElementState extends State<NotificationElement> {
  @override
  Widget build(BuildContext context) {
    final notificationsItem = widget.notificationsItem;
    final itemId = widget.notificationsItem.id;
    final itemKey = itemId != null ? Key(itemId.toString()) : UniqueKey();
    return Dismissible(
      key: itemKey,
      background: Container(
        color: context.color.error,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: SvgPicture.asset(
            CoreAssets.svg.iDelete,
            width: 24,
            height: 26.6,
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        final bloc = CoreDi.get<NotificationsBloc>();
        final result = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return const AlertDeletOneItem();
          },
        );
        if (result == true && widget.notificationsItem.id != null) {
          bloc.add(DeleteNotification(widget.notificationsItem.id!));
        }
        return result ?? false;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 48,
              child: SvgPicture.asset(CoreAssets.svg.mesageLogo1),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationsItem.title ?? '',
                    style: context.text.m16w400,
                  ),
                  const SizedBox(height: 5),
                  Text(notificationsItem.body ?? '', style: context.text.m14w400, maxLines: 2),
                  const SizedBox(height: 5),
                  Text(
                    notificationsItem.createdAt != null ? DateFormat('MMM dd, hh:mm').format(notificationsItem.createdAt!.toLocal()) : '',
                    style: context.text.gText10w400,
                  ),
                ],
              ),
            ),
            if (notificationsItem.status != null && notificationsItem.status == 'unread')
              SvgPicture.asset(
                CoreAssets.svg.newNotificatorIndicator,
                width: 8,
                height: 8,
              ),
          ],
        ),
      ),
    );
  }
}
