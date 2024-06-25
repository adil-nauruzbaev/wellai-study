import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/work_th_dto.dart';

import 'th_dr_item.dart';

class DateSelectElement extends StatelessWidget {
  const DateSelectElement({
    required this.appointment,
    required this.showTime,
    super.key,
  });
  final WorkTimeDTO appointment;
  final bool showTime;

  @override
  Widget build(BuildContext context) {
    DateTime? time;
    if (appointment.time != null) {
      try {
        time = DateFormat('hh:mm').parse(appointment.time!, true).toLocal();
      } catch (_) {
        time = null;
      }
    }

    final timeFormatted = time != null ? DateFormat('hh:mm').format(time) : 'N/A';
    final timeFormattedPlus30Min =
        time != null ? DateFormat('hh:mm').format(time.add(const Duration(minutes: 30))) : 'N/A';

    final timeStyle = showTime ? context.text.sh14w500 : context.text.sh14w500.copyWith(color: Colors.transparent);
    final timePlus30MinStyle =
        showTime ? context.text.gsh14w600 : context.text.gsh14w600.copyWith(color: Colors.transparent);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timeFormatted,
                  style: timeStyle,
                ),
                Text(
                  timeFormattedPlus30Min,
                  style: timePlus30MinStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            color: context.color.borderGrey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                THDrItem(appointment: appointment),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
