import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/dto/documents_dto.dart';
import '../../../../data/dto/filter.dart';
import 'by_clinic_element.dart';
import 'not_by_clinic_element.dart';

class GridElement extends StatefulWidget {
  const GridElement({
    required this.documentItem,
    super.key,
    required this.currentFilter,
  });
  final DocumentResponceDto documentItem;
  final FilterDTO currentFilter;
  @override
  State<GridElement> createState() => _GridElementState();
}

class _GridElementState extends State<GridElement> {
  @override
  Widget build(BuildContext context) {
    final documentItem = widget.documentItem;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.backgroundGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (documentItem.byClinic != true) const ByClinicElement(),
            if (documentItem.byClinic != false)
              NotByClinicElement(
                documentItem: documentItem, currentFilter: widget.currentFilter,
                //currentFilter: null,
                // currentFilter: currentFilter,
                // onDocumentAction: (FilterDTO filterDTO) {
                //   CoreDi.get<DocumentsModelBloc>},
              ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.color.outlineButton,
                      ),
                    ),
                    child: Text(
                      documentItem.category!.name ?? '',
                      style: context.text.sbo10w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('MM/dd/yy').format(
                      documentItem.createdAt ?? DateTime.now(),
                    ),
                    style: context.text.sh10w400,
                  ),
                  if (documentItem.files != null)
                    ...documentItem.files!.map(
                      (file) => Text(
                        file.name ?? '',
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: context.text.sh12w400,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
