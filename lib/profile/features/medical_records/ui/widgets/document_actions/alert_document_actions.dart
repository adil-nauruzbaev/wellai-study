import 'package:flutter/material.dart';

import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

Future<int?> showDocumentAction(
  BuildContext context,
) {
  return showModalBottomSheet<int?>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const DocumentActions(),
  );
}

class DocumentActions extends StatelessWidget {
  const DocumentActions({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonTitles = [
      context.s.share,
      context.s.edit,
      context.s.deleteSmol,
      context.s.cancel,
    ];

    final buttonStyles = <TextStyle>[
      context.text.bn16w400,
      context.text.bn16w400,
      context.text.error16w400,
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
              Text(
                context.s.sortDocuments,
                style: context.text.greyT12w400,
                textAlign: TextAlign.center,
              ),
              SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    buttonTitles.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return const Divider(
                          color: Colors.grey,
                        );
                      }

                      final itemIndex = index ~/ 2;
                      return ListTile(
                        title: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            buttonTitles[itemIndex],
                            style: buttonStyles[itemIndex],
                          ),
                        ),
                        onTap: () {
                          // Действия при нажатии на кнопку
                          switch (itemIndex) {
                            case 0:
                              print('Нажата кнопка 1');
                              break;
                            case 1:
                              print('Нажата кнопка 2');
                              break;
                            case 2:
                              Navigator.of(context).pop(2);
                              break;
                            case 3:
                              Navigator.of(context).pop();
                              break;
                            default:
                              break;
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
