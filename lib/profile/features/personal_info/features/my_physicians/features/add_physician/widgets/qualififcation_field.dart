import 'package:flutter/material.dart';
import '../../../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';

import '../data/dto/qualifification_dto.dart';
import 'qualification_select_screen.dart';

class Qualififcation extends StatefulWidget {
  const Qualififcation({
    required this.onCheange,
    super.key,
    this.initial,
  });
  final Function(QualifificationDTO) onCheange;
  final String? initial;

  @override
  State<Qualififcation> createState() => _QualififcationState();
}

class _QualififcationState extends State<Qualififcation> {
  late final AppTextfield qualiciationFied;

  @override
  void initState() {
    qualiciationFied = AppTextfield(
      data: AppTextfieldData(
        initial: widget.initial,
        enabled: false,
        hintText: S.current.qualififcation,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final result = await Navigator.push<QualifificationDTO>(
          context,
          MaterialPageRoute(
            builder: (context) => const QualifificationSelectScreen(),
          ),
        );
        if (result != null) {
          qualiciationFied.data.controller.text = result.name ?? '';
          widget.onCheange(result);
        }
      },
      child: qualiciationFied,
    );
  }
}
