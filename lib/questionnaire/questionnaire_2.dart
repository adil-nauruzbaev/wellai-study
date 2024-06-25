import 'package:flutter/material.dart';
import '../shared/l10n/generated/l10n.dart';
import '../shared/widgets/check_box.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../shared/widgets/text_fields/phone_textfield.dart';
import '/shared/l10n/l10n_helper.dart';
import 'feature/pharmacies/ui/widgets/fields/alergies_selectable_buttons_list.dart';
import 'questionnaire_3.dart';

import 'feature/pharmacies/ui/widgets/fields/pharmacy_tile.dart';

class Questionnaire2 extends StatefulWidget {
  const Questionnaire2({super.key});

  @override
  State<Questionnaire2> createState() => _Questionnaire2State();
}

class _Questionnaire2State extends State<Questionnaire2> {
  final phoneTextfield = PhoneTextfield(
    data: PhoneTextfieldData(hintText: 'Pharmacy Phone'),
  );

  bool isActive = false;

  final allergisField = AppTextfield(
    data: AppTextfieldData(
      hintText: S.current.pleaseWriteYourAllergiesIfYouHaveAny,
      maxLines: null,
      minLines: 5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.color.shadow,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 20),
                Text(
                  context.s.pleaseAnswe,
                  style: context.text.gDGn14w400,
                ),
                const SizedBox(height: 32),
                Text(
                  context.s.Step2,
                  style: context.text.aDr18w400,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  context.s.doYouHaveAnyAllergies,
                  style: context.text.m18w400,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomCheckbox(
                  onChange: (value) {
                    allergisField.data.enabled = !value;
                    setState(() {});
                  },
                  textSpans: [
                    TextSpan(
                      text: context.s.iDontHaveAllergies,
                      style: context.text.shadowGr14w400,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                allergisField,
                const SizedBox(
                  height: 20,
                ),
                if (allergisField.data.enabled)
                  AlergiesSelectableButtonsList(
                    onTap: (value) {
                      allergisField.data.controller.text += value;
                    },
                  ),
                const SizedBox(height: 32),
                Text(
                  context.s.yourPharmacy,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 16),
                const PharmacyTextField(),
                const SizedBox(height: 16),
                phoneTextfield,
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
                      context.rootRouter.use.push(const Questionnaire3());
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
