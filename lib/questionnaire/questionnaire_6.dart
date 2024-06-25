import 'package:flutter/material.dart';
import '../shared/l10n/generated/l10n.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '/shared/l10n/l10n_helper.dart';
import 'questionnaire_7.dart';

class Questionnaire6 extends StatefulWidget {
  const Questionnaire6({super.key});

  @override
  State<Questionnaire6> createState() => _Questionnaire6State();
}

class _Questionnaire6State extends State<Questionnaire6> {
  @override
  Widget build(BuildContext context) {
    final medicationsNameField = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.pleaseWriteTheMdicationsName,
        maxLines: null,
        minLines: 5,
      ),
    );
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
                Text(
                  context.s.step6,
                  style: context.text.aDr18w400,
                ),
                const SizedBox(height: 32),
                Text(
                  context.s.whatMedicationsAreYouCurrentlyTaking,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 16),
                medicationsNameField,
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
                      context.rootRouter.use.push(const Questionnarie7());
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
