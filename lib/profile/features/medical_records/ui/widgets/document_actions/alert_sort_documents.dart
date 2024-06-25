import 'package:flutter/material.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto/filter.dart';
import '/shared/l10n/l10n_helper.dart';

Future<FilterDTO?> showSortBottomSheet(BuildContext context, FilterDTO currentFilter) {
  return showModalBottomSheet<FilterDTO>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => _SortDocuments(currentFilter: currentFilter),
  );
}

class _SortDocuments extends StatelessWidget {
  const _SortDocuments({required this.currentFilter});
  final FilterDTO currentFilter;

  @override
  Widget build(BuildContext context) {
    final buttonTitles = [
      context.s.newDocumentsFirst,
      context.s.oldDocumentsFirst,
      context.s.cancel,
    ];

    final buttonStyles = <TextStyle>[
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
                          FilterDTO? updatedFilter;
                          switch (itemIndex) {
                            case 0:
                              updatedFilter = currentFilter.copyWith(sort: true);
                              break;
                            case 1:
                              updatedFilter = currentFilter.copyWith(sort: false);
                              break;
                            case 2:
                              break;
                          }

                          Navigator.of(context).pop(updatedFilter);
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
