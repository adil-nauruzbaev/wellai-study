import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto_history/history_notification.dart';
import 'asisstant_tail.dart';
import 'call_tile.dart';
import 'chat_nurse_tail.dart';

class HistoryElement extends StatefulWidget {
  const HistoryElement({
    required this.historyItem,
    super.key,
  });
  final HistoryDto historyItem;

  @override
  State<HistoryElement> createState() => _HistoryElementState();
}

class _HistoryElementState extends State<HistoryElement> {
  @override
  Widget build(BuildContext context) {
    final historyItem = widget.historyItem;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              DateFormat('MMM dd, hh:mm a').format(
                historyItem.session_createdAt ?? DateTime.now(),
              ),
              textAlign: TextAlign.center,
              style: context.text.sn14w400,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (historyItem.call_date != null)
                      CallTile(
                        historyItem: historyItem,
                      ),
                    if (historyItem.chat_id != null)
                      ChatTile(
                        historyItem: historyItem,
                      ),
                    if (historyItem.assistant_id != null)
                      AssistantTail(
                        historyItem: historyItem,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
