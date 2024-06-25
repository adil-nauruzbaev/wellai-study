import 'package:flutter/material.dart';
import '../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import 'bottom_sheet/biological_sex_bottom.dart';

class DropdownChooseSex extends StatefulWidget {
  const DropdownChooseSex({
    super.key,
    this.initialValue,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  State<DropdownChooseSex> createState() => _DropdownChooseSexState();
}

class _DropdownChooseSexState extends State<DropdownChooseSex> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedValue = widget.initialValue!.toLowerCase() == 'female' ? 'Female' : 'Male';
    }
  }

  Future<void> _handleTap() async {
    final result = await showSelectBiologicalSexBottomSheet(context);
    if (result != null && result.isNotEmpty) {
      setState(() {
        _selectedValue = result;
        widget.onChanged!(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dropdownChooseSex = AppTextfield(
      data: AppTextfieldData(
        initial: _selectedValue,
        hintText: S.current.biologicalSex,
        enabled: false,
      ),
    );

    return GestureDetector(
      onTap: _handleTap,
      child: dropdownChooseSex,
    );
  }
}
