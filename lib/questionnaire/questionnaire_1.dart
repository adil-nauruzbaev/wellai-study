import 'package:flutter/material.dart';

import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/first_name_text_field.dart';
import '../shared/widgets/text_fields/last_name_text_field.dart';
import '../shared/widgets/text_fields/phone_textfield.dart';
import '/shared/l10n/l10n_helper.dart';
import 'questionnaire_2.dart';
import 'feature/pharmacies/ui/widgets/fields/data_piker_field.dart';
import 'feature/pharmacies/ui/widgets/fields/dropdown_biological_sex.dart';

class Questionnaire1 extends StatefulWidget {
  const Questionnaire1({super.key});

  @override
  State<Questionnaire1> createState() => _Questionnaire1State();
}

class _Questionnaire1State extends State<Questionnaire1> {
  final firstNameTextField = FirstNameTextField(
    data: FirstNameTextfieldData(hintText: 'First Name'),
  );

  final lastNameTextField = LastNameTextfield(
    data: LastNameTextfieldData(hintText: 'First Name'),
  );
  final phoneTextfield = PhoneTextfield(
    data: PhoneTextfieldData(hintText: 'Phone'),
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    context.s.pleaseAnswe,
                    style: context.text.gDGn14w400,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    context.s.Step1,
                    style: context.text.aDr18w400,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    context.s.personalInformation,
                    style: context.text.m18w400,
                  ),
                  const SizedBox(height: 16),
                  firstNameTextField,
                  const SizedBox(height: 16),
                  lastNameTextField,
                  const SizedBox(height: 16),
                  const DropdownBiologicalSex(),
                  const SizedBox(height: 16),
                  phoneTextfield,
                  const SizedBox(height: 16),
                  const DataPikerField(),
                  const SizedBox(height: 16),
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
                        context.rootRouter.use.push(const Questionnaire2());
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
      ),
    );
  }
}
