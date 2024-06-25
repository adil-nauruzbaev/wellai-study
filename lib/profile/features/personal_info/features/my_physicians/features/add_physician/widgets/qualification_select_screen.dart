import 'package:flutter/material.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/dto/qualifification_dto.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';

import 'qualiffication_list.dart';

class QualifificationSelectScreen extends StatefulWidget {
  const QualifificationSelectScreen({super.key});

  @override
  State<QualifificationSelectScreen> createState() => _QualifificationSelectScreenState();
}

class _QualifificationSelectScreenState extends State<QualifificationSelectScreen> {
  QualifificationDTO? qualifification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.qualififcation,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 24),
                Text(
                  context.s.chooseQualification,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 24),
                ListOfQualofifications(
                  onSelectionChanged: (QualifificationDTO? qualifification) {
                    this.qualifification = qualifification;
                  },
                  initial: null,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.color.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      style: context.button.elevated1,
                      onPressed: () {
                        Navigator.pop(context, qualifification);
                      },
                      child: Text(
                        context.s.chooseQualification2,
                        style: context.text.n16w400,
                      ),
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
