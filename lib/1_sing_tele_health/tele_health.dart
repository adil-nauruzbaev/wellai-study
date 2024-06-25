import 'package:flutter/material.dart';
import '../profile/features/medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';
import '../shared/l10n/generated/l10n.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import 'selecte_date_sceen/selecte_date_screen.dart';
import 'widgets/image_piker_th.dart';
import '/shared/l10n/l10n_helper.dart';

class TeleHealthScreen extends StatefulWidget {
  const TeleHealthScreen({super.key});

  @override
  State<TeleHealthScreen> createState() => _TeleHealthScreenState();
}

class _TeleHealthScreenState extends State<TeleHealthScreen> {
  late final AppTextfield coment;
  @override
  void initState() {
    coment = AppTextfield(
      data: AppTextfieldData(
        maxLines: 5,
        hintText: S.current.yourComment,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.teleHealth,
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
                  context.s.teleHealthByFillingOut,
                  style: context.text.ss14w400,
                ),
                const SizedBox(height: 20),
                coment,
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: ImagePickerTH(),
                    ),
                  ],
                ),
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
                      context.rootRouter.use.push(const SelectDateScreen());
                    },
                    child: Text(
                      context.s.signupForaCall,
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
