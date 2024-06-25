import 'package:flutter/material.dart';
import '../../../../../settings/widgets/custom_list_item.dart';
import '../../../../../shared/navigator/navigator1_helper.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';
import 'widgets/drivers_license_screen.dart';
import 'widgets/insurance_screen.dart';

class MyDocumentsScreen extends StatefulWidget {
  const MyDocumentsScreen({super.key});

  @override
  State<MyDocumentsScreen> createState() => _MyDocumentsScreenState();
}

class _MyDocumentsScreenState extends State<MyDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.myDocuments,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 10),
          CustomListItem(
            onTap: () {
              context.rootRouter.use.push(const DriversLicenseScreen());
            },
            text: context.s.driversLicense,
          ),
          CustomListItem(
            onTap: () {
              context.rootRouter.use.push(const InsuranceScreen());
            },
            text: context.s.insurance,
          ),
        ],
      ),
    );
  }
}
