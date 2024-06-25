import 'package:flutter/material.dart';

import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

class AlertDelete extends StatelessWidget {
  const AlertDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        context.s.areYouSureYouWantToDeleteThisNotification,
        style: context.text.s18w500,
      ),
      content: Text(
        context.s.ifYouDeleteItYouWontBeAbleToRestoreIt,
        style: context.text.s14w400.copyWith(color: context.color.greyText),
      ),
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
                      child: Text(
                        context.s.delete,
                        style: context.text.s14w500
                            .copyWith(color: context.color.background),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                context.s.cancel,
                style: context.text.s14w500
                    .copyWith(color: context.color.buttonGreen),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
