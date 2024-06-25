import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/app_assets.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class NotificationsNull extends StatelessWidget {
  const NotificationsNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            height: 280,
            width: 291,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(CoreAssets.svg.notificationNull),
                SizedBox(
                  height: 112,
                  width: 112,
                  child: SvgPicture.asset(CoreAssets.svg.iBigNotification),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          context.s.youDontHaveAnyNotifications,
          style: context.text.gDGn14w400,
        ),
      ],
    );
  }
}
