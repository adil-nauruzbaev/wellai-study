import 'package:flutter/material.dart';

import '../shared/l10n/generated/l10n.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import 'feature/medical_conditions/medical_conditions_list.dart';

class Questionnarie7 extends StatefulWidget {
  const Questionnarie7({super.key});

  @override
  State<Questionnarie7> createState() => _Questionnarie7State();
}

class _Questionnarie7State extends State<Questionnarie7> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final medicalConditionField = AppTextfield(
    data: AppTextfieldData(
      hintText: S.current.pleaseTypeAnyOtherMedicalConditionHere,
      maxLines: null,
      minLines: 5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.background,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            context.s.pleaseTypeAnyOtherMedicalConditionHere,
            style: context.text.m18w400,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.color.shadow,
            size: 32,
          ),
          onPressed: () {
            // Navigator.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              children: [
                Text(
                  context.s.step7,
                  style: context.text.aDr18w400,
                ),
                const SizedBox(height: 32),
                Text(
                  context.s.DoYouHaveAnyOfTheFollowingMedicalConditions,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 14),
                MedicinaLConditionsList(medicalConditionsextController: _controller),
              ],
            ),
          ),
          medicalConditionField,
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
                        // Navigator.pop(context, pharmacyField.data.controller.text);
                      },
                      child: Text(
                        context.s.continuee,
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
