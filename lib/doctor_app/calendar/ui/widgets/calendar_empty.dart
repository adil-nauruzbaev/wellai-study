import 'package:flutter/material.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

class CalendarEmpty extends StatelessWidget {
  const CalendarEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth - 80;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(CoreAssets.images.calendarEmptyIcon),
            width: imageWidth,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text(
              context.s.theCalendarHasNotBeenUpdatedYet,
              style: context.text.s14w400
                  .copyWith(color: context.color.grayscaleDarkGray),
            ),
          ),
          Text(
            context.s.pleaseTryToVisitThisPageLater,
            style: context.text.s14w400
                .copyWith(color: context.color.grayscaleDarkGray),
          ),
        ],
      ),
    );
  }
}
