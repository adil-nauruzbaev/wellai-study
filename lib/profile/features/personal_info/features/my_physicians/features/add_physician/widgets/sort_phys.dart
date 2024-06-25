import 'package:flutter/material.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';

import '../data/dto/filte_phys_dto.dart';
import '/shared/l10n/l10n_helper.dart';

Future<FilterPhysDTO?> showSorPhystBottomSheet(
  BuildContext context,
  FilterPhysDTO currentFilter,
) {
  return showModalBottomSheet<FilterPhysDTO>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => _SortPhysicians(
      currentFilter: currentFilter,
    ),
  );
}

class _SortPhysicians extends StatelessWidget {
  const _SortPhysicians({required this.currentFilter});
  final FilterPhysDTO currentFilter;

  @override
  Widget build(BuildContext context) {
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
                context.s.sortPhysicians,
                style: context.text.greyT12w400,
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.s.fromAtoZ,
                  style: context.text.g16w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.s.fromZtoA,
                  style: context.text.g16w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.s.lastAdded,
                  style: context.text.g16w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.s.firstAdded,
                  style: context.text.g16w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: context.color.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            onPressed: () {
              FilterPhysDTO? updatedFilter;
              Navigator.of(context).pop(updatedFilter);
            },
            child: Text(
              context.s.cancel,
              style: context.text.g16w400,
            ),
          ),
        ),
      ],
    );
  }
}
