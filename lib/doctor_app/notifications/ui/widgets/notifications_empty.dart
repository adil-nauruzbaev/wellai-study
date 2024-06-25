import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/app_assets.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

class NotificationsEmpty extends StatelessWidget {
  const NotificationsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth - 84;
    final iconWidth = screenWidth * 0.21;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                CoreAssets.svg.notificationNull,
                width: imageWidth,
              ),
              SvgPicture.asset(
                CoreAssets.svg.iBigNotification,
                width: iconWidth,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text(
              context.s.youDontHaveAnyNotifications,
              style: context.text.s14w400
                  .copyWith(color: context.color.grayscaleDarkGray),
            ),
          ),
        ],
      ),
    );
  }
}
