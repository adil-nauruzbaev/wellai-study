import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/widgets/check_box.dart';
import '../../shared/navigator/navigator1_helper.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../../shared/widgets/text_fields/last_name_text_field.dart';
import '../../shared/widgets/text_fields/first_name_text_field.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../shared/app_assets.dart';
import 'change_password_screen.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({super.key});

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  final firstNameField = FirstNameTextField(
    data: FirstNameTextfieldData(
      hintText: 'First Name',
    ),
  );
  final lastNameField = LastNameTextfield(
    data: LastNameTextfieldData(
      hintText: 'Last Name',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 116,
            width: 116,
            child: SvgPicture.asset(
              CoreAssets.svg.logoBlack,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              //TODO verifai font,
              textAlign: TextAlign.center, context.s.WelcomeToBentTreeFamilyPhysiciansApp,
              style: context.text.aDr18w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 56),
            child: Text(
              textAlign: TextAlign.left,
              context.s.PleaseTypeYourFullName,
              style: context.text.m16w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: firstNameField,
          ),
          lastNameField,
          const SizedBox(
            height: 50,
          ),
          CustomCheckbox(
            textSpans: [
              TextSpan(
                text: context.s.IAgreeTo,
                style: context.text.sn14w400,
              ),
              TextSpan(
                text: context.s.BentTreeFamilyPhysicianTermsofUse,
                style: context.text.sb14w400,
              ),
              TextSpan(
                text: context.s.AndConfirmThatImAtLeast17YearsOld,
                style: context.text.sn14w400,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomCheckbox(
            textSpans: [
              TextSpan(
                text: context.s.IAgreeTo,
                style: context.text.sn14w400,
              ),
              TextSpan(
                text: context.s.BentTreeFamilyPhysician,
                style: context.text.sb14w400,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomCheckbox(
            textSpans: [
              TextSpan(
                text: context.s.IAgreeTo,
                style: context.text.sn14w400,
              ),
              TextSpan(
                text: context.s.BentTreeFamilyPhysiciansPrivacyPolicy,
                style: context.text.sb14w400,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: context.button.elevated1,
                  onPressed: () {
                    context.rootRouter.use.push(const ChangePasswordScreen());
                  },
                  child: Text(
                    context.s.continuee,
                    style: context.text.n16w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
