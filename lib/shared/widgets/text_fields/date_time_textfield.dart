import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme/themes/_interface/app_theme.dart';
import 'app_textfield/app_textfield.dart';

class DateTimeTextfield extends AppTextfield {
  DateTimeTextfield({
    super.key,
    DateTimeTextfieldData? data,
  }) : super(
          data: data ?? DateTimeTextfieldData(),
        );
}

class DateTimeTextfieldData extends AppTextfieldData {
  DateTimeTextfieldData({
    super.enabled,
    super.initial,
    super.nextFocus,
    super.style,
    super.debounce,
    super.onFocusLost,
    super.maxLength,
    super.autofocus = false,
    super.onSubmit,
    super.hintText,
    super.keyboardType = TextInputType.number,
    Function(DateTime)? onChanged,
  }) : super(
          onTap: (context, controller) async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.tryParse(initial ?? '') ?? DateTime(DateTime.now().year).subtract(const Duration(days: 365 * 18)),
              firstDate: DateTime(1910),
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData(
                    primarySwatch: MaterialColor(
                      context.color.accent.value,
                      <int, Color>{
                        50: context.color.accent,
                        100: context.color.accent,
                        200: context.color.accent,
                        300: context.color.accent,
                        400: context.color.accent,
                        500: context.color.accent,
                        600: context.color.accent,
                        700: context.color.accent,
                        800: context.color.accent,
                        900: context.color.accent,
                      },
                    ),
                  ),
                  child: child ?? Container(),
                );
              },
            );
            if (date != null) {
              controller.text = DateFormat('MM/dd/yyyy').format(date);
              onChanged?.call(date);
            }
          },

          validator: AppTextfield.defaultValidator,
          readonly: true,
          // suffixIcon: (color) => Padding(
          //   padding: const EdgeInsets.only(right: 16),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Assets.iconsSvg.icCalendar.svg(
          //         height: 23,
          //         width: 23,
          //       ),
          //     ],
          //   ),
          // ),
        );
}
