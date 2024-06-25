import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../shared/app_assets.dart';
import '../../shared/data/root_gateway/root_gateway.dart';
import '../../shared/init/core_d_i.dart';
import '../../shared/l10n/source/local_storage.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto_history/history_notification.dart';

class CallTile extends StatefulWidget {
  const CallTile({
    required this.historyItem,
    super.key,
  });
  final HistoryDto historyItem;

  @override
  State<CallTile> createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
  @override
  Widget build(BuildContext context) {
    final historyItem = widget.historyItem;
    final baseUrl = CoreDi.get<RootGateway>().gateway.uriGeneral.toString();
    final token = CoreDi.get<LocalStorage>().read('token').toString();

    String? title;
    final details = [];
    TextStyle? detailTextStyle;

    // Определение типа истории и деталей

    title = 'Telehealth';
    String? prefixText;

    switch (historyItem.call_status) {
      case 'missed':
        prefixText = 'Missed at ';
        detailTextStyle = context.text.err14w400;
      case 'finish':
        prefixText = 'Scheduled call for ';
        detailTextStyle = context.text.ac14w400;
      default:
        break;
    }

    if (prefixText != null && detailTextStyle != null) {
      details.add(
        Text(
          "$prefixText${DateFormat('MMM dd, hh:mm a').format(historyItem.call_date!)}",
          style: detailTextStyle,
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
                      imageUrl: '$baseUrl' 'images/' '${historyItem.call_user_profile_image_name ?? ''}',
                      httpHeaders: {'Authorization': 'Bearer $token'},
                      fit: BoxFit.cover,
                      placeholder: (context, _) => BlurHash(hash: historyItem.call_user_profile_image_blur ?? ''),
                    ),
                  ),
                ),
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
                    child: SvgPicture.asset(
                      CoreAssets.svg.iconPhone,
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
                  Text(title, style: context.text.m14w400),
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
