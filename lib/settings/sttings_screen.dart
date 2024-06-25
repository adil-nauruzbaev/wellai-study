import 'package:flutter/material.dart';
import '../1_sing_tele_health/tele_health.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import 'features/contact_us_screen.dart';
import 'widgets/custom_list_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: context.color.background,
        title: Text(
          context.s.settings,
          style: context.text.m24w400,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 24),
          Text(
            context.s.security,
            style: context.text.greyText14w400,
          ),
          CustomListItem(
            text: context.s.voiceAssistant,
            icon: const Switcher(),
          ),
          CustomListItem(
            onTap: () {
              context.rootRouter.use.push(const TeleHealthScreen());
            },
            text: context.s.changeShortcutCode,
          ),
          CustomListItem(
            text: context.s.turnOffShortcutCode,
          ),
          CustomListItem(
            text: context.s.loginWithDaceId,
            icon: const Switcher(),
          ),
          const SizedBox(height: 32),
          Text(
            context.s.info,
            style: context.text.greyText14w400,
          ),
          CustomListItem(
            text: context.s.contactUs,
            onTap: () {
              context.rootRouter.use.push(const ContactUsScreen());
            },
          ),
          CustomListItem(
            text: context.s.termsOfUse,
          ),
          CustomListItem(
            text: context.s.privacyPolicy,
          ),
          CustomListItem(
            text: context.s.shareWellAiApp,
          ),
          CustomListItem(
            text: context.s.rateTheApp,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.s.appVersion,
                style: context.text.greyText14w400,
              ),
              Text(
                context.s.version,
                style: context.text.greyText14w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
