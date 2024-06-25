import 'package:flutter/material.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';

Future<String?> showSelectBiologicalSexBottomSheet(BuildContext context) {
  return showModalBottomSheet<String?>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const ChooseBiologicalSex(),
  );
}

class ChooseBiologicalSex extends StatelessWidget {
  const ChooseBiologicalSex({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      context.s.male,
      context.s.female,
      context.s.cancel,
    ];
    final optionStyles = <TextStyle>[
      context.text.bn16w400,
      context.text.bn16w400,
      context.text.ssb16w400,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    options.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return const Divider(color: Colors.grey);
                      }
                      final itemIndex = index ~/ 2;
                      return ListTile(
                        title: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            options[itemIndex],
                            style: optionStyles[itemIndex],
                          ),
                        ),
                        onTap: () {
                          if (itemIndex < 2) {
                            Navigator.pop(context, options[itemIndex]);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
