import 'package:flutter/material.dart';

import '../../../../../shared/theme/themes/_interface/app_theme.dart';

class CustomAppBarForMedicalRecords extends StatelessWidget {
  const CustomAppBarForMedicalRecords({
    this.elevation,
    super.key,
    this.title,
    this.actions,
  });
  final String? title;
  final double? elevation;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
        child: Text(
          title ?? 'Default Title',
          style: context.text.m18w400,
        ),
      ),
      centerTitle: true,
      elevation: elevation,
      automaticallyImplyLeading: false,
      backgroundColor: context.color.background,
      actions: actions ?? [],
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
    );
  }
}
