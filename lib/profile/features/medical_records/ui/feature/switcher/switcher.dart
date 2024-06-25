import 'package:flutter/material.dart';
import '../../../../../../shared/navigator/navigator1_helper.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../empty_list_uploaded_documents.dart';
import '/shared/l10n/l10n_helper.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  int? _activeButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.color.buttonBackground, borderRadius: BorderRadius.circular(100)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: _activeButton == 1 ? context.button.elevated4select : context.button.elevated4,
              onPressed: _activeButton != 1
                  ? () {
                      setState(() {
                        _activeButton = 1;
                      });
                      context.rootRouter.use.push(const EmptyListUploadedDocuments());
                    }
                  : null,
              child: Text(
                context.s.medicalRecords,
                style: _activeButton == 1 ? context.text.greyText14w400 : context.text.sb14w400,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: _activeButton == 2 ? context.button.elevated4select : context.button.elevated4,
              onPressed: _activeButton != 2
                  ? () {
                      setState(() {
                        _activeButton = 2;
                      });
                      context.rootRouter.use.push(const EmptyListDocumentsRequest());
                    }
                  : null,
              child: Text(
                context.s.visualSummary,
                style: _activeButton == 2 ? context.text.greyText14w400 : context.text.sb14w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
