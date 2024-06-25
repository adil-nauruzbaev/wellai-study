import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../profile/features/medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.contactUs,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 24),
          Text(
            context.s.ourContacts,
            style: context.text.ssb16w400,
          ),
          const SizedBox(height: 8),
          Text(
            context.s.addressUs,
            style: context.text.m14w400,
          ),
          const SizedBox(height: 2),
          Text(
            context.s.addressUs2,
            style: context.text.greyText14w400,
          ),
          const SizedBox(height: 8),
          Text(
            context.s.openingHours,
            style: context.text.m14w400,
          ),
          const SizedBox(height: 2),
          Text(
            context.s.openingHours2,
            style: context.text.greyText14w400,
          ),
          const SizedBox(height: 8),
          Text(
            context.s.phone,
            style: context.text.m14w400,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () async {
                const telephoneNumber = '(972) 377-8800';
                const telephoneUrl = 'tel:$telephoneNumber';
                if (await canLaunch(telephoneUrl)) {
                  await launch(telephoneUrl);
                } else {
                  throw 'Error occured trying to call that number.';
                }
              },
              child: Text(
                context.s.phone2,
                style: context.text.ac14w400.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            context.s.usefulLinks,
            style: context.text.ssb16w400,
          ),
          const SizedBox(height: 8),
          Text(
            context.s.ourEmail,
            style: context.text.m14w400,
          ),
          Text(
            context.s.ourEmail2,
            style: context.text.ac14w400.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.s.ourWebsite,
            style: context.text.m14w400,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () async {
                const url = 'https://www.benttreemd.com';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                context.s.ourWebsite2,
                style: context.text.ac14w400.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
