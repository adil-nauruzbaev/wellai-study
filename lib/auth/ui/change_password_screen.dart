import 'package:flutter/material.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../../shared/widgets/text_fields/new_password_text_field.dart';
import '../../shared/widgets/text_fields/repeat_password_text_field.dart';
import '/shared/l10n/l10n_helper.dart';
import 'password_cheanged.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final newPasswordField = NewPasswordTextField(
    data: NewPasswordTextFieldData(hintText: 'New password'),
  );
  final repeatPasswordField = RepeatPasswordTextField(
    data: RepeatPasswordTextFieldData(hintText: 'Repeat new password'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              context.s.createNewPassword,
              style: context.text.m24w400,
            ),
            const SizedBox(height: 8),
            Text(
              context.s.youUsedTheOneTimePassword,
              style: context.text.sn14w400,
            ),
            const SizedBox(height: 28),
            newPasswordField,
            const SizedBox(height: 16),
            repeatPasswordField,
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: context.button.elevated3,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const PasswordCheamged(); // Ваш кастомный виджет диалога
                          },
                        );
                      },
                      child: Text(context.s.reatePassword),
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
