// ignore_for_file: unnecessary_raw_strings

import 'package:flutter/services.dart';
//import 'package:flutter_svg/svg.dart';

import '../../l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';

class NewPasswordTextField extends AppTextfield {
  NewPasswordTextField({
    super.key,
    NewPasswordTextFieldData? data,
  }) : super(
          data: data ?? NewPasswordTextFieldData(),
        );
}

class NewPasswordTextFieldData extends AppTextfieldData {
  NewPasswordTextFieldData({
    super.onChanged,
    super.onSubmit,
    super.onFocusLost,
    super.enabled = true,
    super.hintText,
    super.keyboardType = TextInputType.text,
    super.textCapitalization = TextCapitalization.none,
    super.nextFocus,
    super.isVisibleObscureButton = true,
    super.obscureText = true,
    List<String> Function(String?)? validator,
  }) : super(
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'[а-яА-Я]'),
            ),
          ],
          validator: validator ??
              (value) {
                final output = <String>[];
                if (value.isEmpty) {
                  output.add(S.current.inputErrorPasswordIsEmpty);
                  return output;
                }
                if (value.length < 8) {
                  output.add(S.current.inputErrorPasswordIsShort);
                }
                if (!RegExp(r'[\d]').hasMatch(value)) {
                  output.add(S.current.inputErrorPasswordMustContainDigit);
                }

                return output;
              },
        );
}
