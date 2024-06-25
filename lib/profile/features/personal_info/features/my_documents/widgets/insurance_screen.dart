import 'package:flutter/material.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';
import 'my_doc_image.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.insurance,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(
                  height: 32,
                ),
                Text(
                  context.s.insuranceFrontSide2,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 16),
                const MyDocImage(),
                const SizedBox(height: 32),
                Text(
                  context.s.insuranceBackSide2,
                  style: context.text.m18w400,
                ),
                const SizedBox(
                  height: 16,
                ),
                const MyDocImage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.button.elevated1,
                    onPressed: () {
                      // context.rootRouter.use.push(const Questionnaire6());
                    },
                    child: Text(
                      context.s.continuee,
                      style: context.text.n16w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
