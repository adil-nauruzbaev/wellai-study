import 'package:flutter/material.dart';
import '../../../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../../../../shared/widgets/text_fields/phone_textfield.dart';
import 'widgets/qualififcation_field.dart';

class AddPhysician extends StatefulWidget {
  const AddPhysician({super.key});

  @override
  State<AddPhysician> createState() => _AddPhysicianState();
}

class _AddPhysicianState extends State<AddPhysician> {
  int? selectedQualifficationId;
  late final AppTextfield physicianName;
  late final PhoneTextfield physicianPhone;
  late final AppTextfield wbsite;

  @override
  void initState() {
    super.initState();
    physicianName = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.name,
      ),
    );
    physicianPhone = PhoneTextfield(
      data: PhoneTextfieldData(
        hintText: S.current.phone,
      ),
    );
    wbsite = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.website,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.addPhysician,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 24),
                physicianName,
                const SizedBox(height: 16),
                Qualififcation(
                  onCheange: (qualififcationDto) {
                    selectedQualifficationId = qualififcationDto.id;
                  },
                ),
                const SizedBox(height: 16),
                physicianPhone,
                const SizedBox(height: 16),
                wbsite,
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
                    onPressed: () {},
                    child: Text(
                      context.s.save,
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
