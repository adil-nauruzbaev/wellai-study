import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/app_assets.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../medical_records/ui/records_screen.dart';
import '../../../notifications/ui/notifications_screen.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.color.background),
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(CoreAssets.images.avatarAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 7),
                  child: Text(
                    'Dr. John Zimmermann ',
                    style: context.text.s24w700
                        .copyWith(color: context.color.textPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsDocScreen(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      CoreAssets.svg.iBigNotification,
                      colorFilter: ColorFilter.mode(
                        context.color.textPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: context.s.EnterThePatientName,
              hintStyle:
                  context.text.s16w400.copyWith(color: context.color.greyText),
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 15,
              ),
              prefixIconColor: context.color.grey700,
              filled: true,
              fillColor: context.color.backgroundGrey,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: context.color.backgroundGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: context.color.backgroundGrey),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}
