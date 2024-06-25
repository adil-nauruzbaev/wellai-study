import 'package:flutter/material.dart';

import '../../l10n/generated/l10n.dart';
import 'app_textfield/app_textfield.dart';

class FullNameTextfieldData extends AppTextfieldData {
  FullNameTextfieldData({
    super.enabled,
    super.initial,
    super.maxLength,
    super.nextFocus,
    super.style,
    super.debounce,
    super.onChanged,
    super.onSubmit,
    super.maxLines,
    super.minLines,
    super.keyboardType = TextInputType.text,
    String? hintText,
    bool showPrefixIcon = true,
    Widget Function(Color?)? prefixIcon,
    super.suffixIcon,
    bool isValidatorEnabled = true,
    List<String> Function(String?)? validator,
  }) : super(
          hintText: hintText ?? S.current.fullName,
          validator: validator ??
              (value) {
                if (!isValidatorEnabled) return <String>[];
                return AppTextfield.defaultValidator(value);
              },
          prefixIcon: !showPrefixIcon
              ? null
              : prefixIcon ??
                  (color) => Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(7),
                        child: Icon(
                          Icons.account_circle,
                          color: color,
                        ),
                      ),
        );
}

class FullNameTextField extends AppTextfield {
  FullNameTextField({
    super.key,
    FullNameTextfieldData? data,
  }) : super(
          data: data ?? FullNameTextfieldData(),
        );
}
