import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import '../../shared/data/root_gateway/root_gateway.dart';
import '../../shared/init/core_d_i.dart';
import '../../shared/l10n/source/local_storage.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto_history/history_notification.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    required this.historyItem,
    super.key,
  });
  final HistoryDto historyItem;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    final historyItem = widget.historyItem;
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = CoreDi.get<LocalStorage>().read('token').toString();
    String? title;
    final details = [];
    TextStyle? detailTextStyle;

    // Определение типа истории и деталей

    if (historyItem.chat_id != null) {
      title = 'Nurse Chat';
      details.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${historyItem.chat_user_profile_firstName ?? ''} ${historyItem.chat_user_profile_lastName ?? ''}',
              style: context.text.sn14w400,
            ),
            Text(
              historyItem.chat_message ?? '',
              overflow: TextOverflow.visible,
              style: detailTextStyle,
              maxLines: 1,
            ),
          ],
        ),
      );
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 20),
        child: Row(
          children: [
            //Profile Avatar
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  height: 40,
                  width: 40,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: '$baseUrl' 'images/' '${historyItem.chat_user_profile_image_name ?? ''}',
                      httpHeaders: {'Authorization': 'Bearer $token'},
                      fit: BoxFit.cover,
                      placeholder: (context, _) => BlurHash(hash: historyItem.chat_user_profile_image_blur ?? ''),
                    ),
                  ),
                ),
                if (historyItem.chat_unread_messages_count != null && historyItem.chat_unread_messages_count != 0)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.color.notificationsCout,
                        shape: BoxShape.circle,
                      ),
                      height: 20,
                      width: 20,
                      child: Text(
                        historyItem.chat_unread_messages_count.toString(),
                        style: context.text.sn14w400,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            //Profile details and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title ?? '', style: context.text.m14w400),
                  ...details,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
