import 'package:flutter/material.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class DeleteAlertPhys extends StatelessWidget {
  const DeleteAlertPhys({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Text(
        'Are you sure you want to Delete this Physician?',
        style: context.text.m18w400,
      ),
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: context.button.elevated3,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  style: context.button.outline3,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(context.s.cancel),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
