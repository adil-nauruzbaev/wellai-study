import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';

class ScrollableCalendar extends StatefulWidget {
  const ScrollableCalendar({
    required this.onDateSelected,
    super.key,
  });

  final void Function(String)? onDateSelected;

  @override
  State<ScrollableCalendar> createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<ScrollableCalendar> {
  late DateTime selectedDate;
  late List<DateTime> dateList;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    dateList = _getDatesBetween(
      DateTime.now(),
      DateTime.now().add(const Duration(days: 13)),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(
            DateFormat('yyyy-MM-dd').format(selectedDate),
          );
        }
      },
    );
  }

  List<DateTime> _getDatesBetween(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.color.borderGrey,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: dateList.length,
                    itemBuilder: (context, index) {
                      final date = dateList[index];
                      final day = DateFormat('d').format(date);
                      final weekday = DateFormat('E', 'en_US').format(date);
                      final isSelected =
                          DateFormat('yyyy-MM-dd').format(selectedDate) == DateFormat('yyyy-MM-dd').format(date);

                      return _dateWidget(date, day, weekday, isSelected, context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dateWidget(
    DateTime date,
    String day,
    String weekday,
    bool isSelected,
    BuildContext context,
  ) {
    final backgroundColor = isSelected ? context.color.accent : Colors.transparent;
    final textStyle2 = isSelected ? context.text.bg16w600 : context.text.sh16w600;
    final textStyle1 = isSelected ? context.text.bg14w500 : context.text.sh14w500;

    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
        widget.onDateSelected?.call(DateFormat('yyyy-MM-dd').format(date));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weekday.substring(0, 1), style: textStyle1),
            const SizedBox(height: 4),
            Text(day, style: textStyle2),
          ],
        ),
      ),
    );
  }
}
