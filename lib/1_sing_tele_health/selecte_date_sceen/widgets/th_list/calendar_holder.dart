import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

class CalendarHolder extends StatelessWidget {
  const CalendarHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  CoreAssets.svg.vectorCalendarNodata,
                ),
                Positioned(
                  top: 93,
                  child: SvgPicture.asset(
                    CoreAssets.svg.claendarIcon,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            textAlign: TextAlign.center,
            context.s.listOfDoctorsIsNotReady,
            style: context.text.gDGn14w400,
          ),
        ],
      ),
    );
  }
}
