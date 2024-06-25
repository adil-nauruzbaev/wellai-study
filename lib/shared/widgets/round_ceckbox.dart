import 'package:flutter/material.dart';

import '../theme/themes/_interface/app_theme.dart';

class RoundCheckbox extends StatelessWidget {
  const RoundCheckbox({
    required this.isChecked,
    required this.onChanged,
    super.key,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      child: Container(
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? context.color.accent : context.color.grey100,
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(2),
          child: Icon(
            Icons.check_circle,
            size: 20,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
