import 'package:flutter/material.dart';

import '../../../shared/l10n/generated/l10n.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../shared/widgets/round_ceckbox.dart';

class MedicinaLConditionsList extends StatefulWidget {
  const MedicinaLConditionsList({
    required this.medicalConditionsextController,
    super.key,
  });
  final TextEditingController medicalConditionsextController;

  @override
  State<MedicinaLConditionsList> createState() => _MedicinaLConditionsListState();
}

class _MedicinaLConditionsListState extends State<MedicinaLConditionsList> {
  List<String> selectedItems = [];

  void _updateTextController() {
    widget.medicalConditionsextController.text = selectedItems.join(', ');
  }

  void _handleTap(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      _updateTextController();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pharmacyList = <String>[
      S.current.anxiety,
      S.current.asthma,
      S.current.autoimmuneDisorde,
      S.current.cancer,
      S.current.cOPD,
      S.current.depression,
      S.current.diabetes,
      S.current.heartAttack,
      S.current.heartDisease,
      S.current.highBloodPressure,
      S.current.highCholesterol,
      S.current.hIVAIDS,
      S.current.kidneyDisease,
      S.current.liverDisease,
      S.current.migraines,
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pharmacyList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _handleTap(pharmacyList[index]),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                RoundCheckbox(
                  isChecked: selectedItems.contains(pharmacyList[index]),
                  onChanged: (bool value) {
                    _handleTap(pharmacyList[index]);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  pharmacyList[index],
                  style: context.text.gDGn14w400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
