import 'package:flutter/material.dart';

import '../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class PasswordCheamged extends StatelessWidget {
  const PasswordCheamged({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Text(
        context.s.passwordChanged,
        style: context.text.m18w400,
      ),
      content: SingleChildScrollView(
        child: Text(
          context.s.youHaveSuccessfullyChangedTourPassword,
          style: context.text.sn14w400,
        ),
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
                    Navigator.of(context).pop();
                  },
                  child: Text(context.s.okay),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
