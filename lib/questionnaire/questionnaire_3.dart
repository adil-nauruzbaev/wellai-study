import 'package:flutter/material.dart';
import '../shared/l10n/generated/l10n.dart';
//import '../shared/navigator/navigator1_helper.dart';
import '../shared/navigator/navigator1_helper.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '/shared/l10n/l10n_helper.dart';
import 'feature/states/ui/state_tile.dart';
import 'questionnaire_4.dart';

class Questionnaire3 extends StatefulWidget {
  const Questionnaire3({super.key});

  @override
  State<Questionnaire3> createState() => _Questionnaire3State();
}

class _Questionnaire3State extends State<Questionnaire3> {
  @override
  Widget build(BuildContext context) {
    final addressField = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.address,
      ),
    );
    final addressField2 = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.address2,
      ),
    );
    final cityField = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.city,
      ),
    );
    final zipCodeField = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.zipCode,
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
                  context.s.Step3,
                  style: context.text.aDr18w400,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  context.s.yourAddress,
                  style: context.text.m18w400,
                ),
                const SizedBox(
                  height: 12,
                ),
                addressField,
                const SizedBox(
                  height: 12,
                ),
                addressField2,
                const SizedBox(
                  height: 12,
                ),
                cityField,
                const SizedBox(
                  height: 12,
                ),
                const StateTextField(),
                const SizedBox(
                  height: 12,
                ),
                zipCodeField,
                const SizedBox(
                  height: 16,
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
                      context.rootRouter.use.push(const Questionnaire4());
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
