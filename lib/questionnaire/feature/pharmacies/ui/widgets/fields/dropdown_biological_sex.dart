import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../shared/app_assets.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class DropdownBiologicalSex extends StatefulWidget {
  const DropdownBiologicalSex({
    super.key,
    this.initialValue,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  State<DropdownBiologicalSex> createState() => _DropdownBiologicalSexState();
}

class _DropdownBiologicalSexState extends State<DropdownBiologicalSex> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedValue = widget.initialValue!.toLowerCase() == 'female' ? 'Female' : 'Male';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: SizedBox(
        width: 14,
        height: 14,
        child: SvgPicture.asset(
          CoreAssets.svg.iArrowDown,
        ),
      ),
      decoration: InputDecoration(
        hintText: context.s.biologicalSex,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.color.accent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
