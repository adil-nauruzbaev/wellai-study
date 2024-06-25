import 'package:flutter/material.dart';
import '../../shared/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto_history/history_notification.dart';
import '/shared/l10n/l10n_helper.dart';

class AssistantTail extends StatefulWidget {
  const AssistantTail({
    required this.historyItem,
    super.key,
  });
  final HistoryDto historyItem;

  @override
  State<AssistantTail> createState() => _AssistantTailState();
}

class _AssistantTailState extends State<AssistantTail> {
  @override
  Widget build(BuildContext context) {
    final historyItem = widget.historyItem;
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

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.color.notificationsCout,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(4),
              height: 40,
              width: 40,
              child: Image.asset(
                CoreAssets.images.logoLhat,
              ),
            ),
            const SizedBox(width: 16),
            //Profile details and text

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.s.virtualAssistant, style: context.text.m14w400),
                  Text(
                    historyItem.assistant_symptoms!,
                    overflow: TextOverflow.visible,
                    style: context.text.sn14w400,
                  ),
                  // ...details,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
