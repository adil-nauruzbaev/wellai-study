// ignore_for_file: unnecessary_raw_strings

import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

import '../../l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';

class EmailTextfield extends AppTextfield {
  EmailTextfield({
    super.key,
    EmailTextfieldData? data,
  }) : super(
          data: data ?? EmailTextfieldData(),
        );
}

class EmailTextfieldData extends AppTextfieldData {
  EmailTextfieldData({
    super.enabled,
    super.initial,
    super.nextFocus,
    super.style,
    super.debounce,
    super.onChanged,
    super.onFocusLost,
    super.maxLength,
    super.autofocus = false,
    super.onSubmit,
    super.keyboardType = TextInputType.emailAddress,
    String? hintText,
    bool isValidatorEnabled = true,
    List<String> Function(String?)? validator,
  }) : super(
          textCapitalization: TextCapitalization.none,
          hintText: hintText ?? S.current.email,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'[а-яА-Я]'),
            ),
          ],
          validator: validator ??
              (value) {
                if (!isValidatorEnabled) return <String>[];
                return defaultValidator(value);
              },
        );

  static List<String> defaultValidator(String? value) {
    final output = <String>[];
    if (value?.isEmpty ?? true) {
      output.add(S.current.passwordIsRequired);
      return output;
    }
    if (!isEmail(value!)) {
      output.add(S.current.errorGeneral);
    }
    return output;
  }
}
