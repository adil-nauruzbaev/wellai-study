import 'package:flutter/material.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';

class AppBarTH extends StatelessWidget {
  const AppBarTH({
    required this.dayNumber,
    required this.dayAbbreviation,
    required this.monthYear,
    super.key,
  });

  final String dayNumber;
  final String dayAbbreviation;
  final String monthYear;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.color.notificationsCout,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            context.s.today,
            style: context.text.sbo16w600,
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: context.color.background,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.color.shadow,
          size: 32,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Row(
        children: [
          Text(
            dayNumber,
            style: context.text.n40w600,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dayAbbreviation,
                style: context.text.g14w500,
              ),
              Text(
                monthYear,
                style: context.text.g14w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
