import 'package:flutter/material.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class AlertDeletOneItem extends StatefulWidget {
  const AlertDeletOneItem({super.key});

  @override
  State<AlertDeletOneItem> createState() => _AlertDeletOneItemState();
}

class _AlertDeletOneItemState extends State<AlertDeletOneItem> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(context.s.areYouSureYouWantToDeleteThisNotification),
      content: Text(context.s.ifYouDeleteItYouWontBeAbleToRestoreIt),
      actions: <Widget>[
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: context.button.elevated3,
                      child: Text(context.s.delete),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.s.cancel),
            ),
          ],
        ),
      ],
    );
  }
}
