import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/dto/documents_dto.dart';
import 'by_clinicList_element.dart';
import 'not_by_clinic_list_element.dart';

class ListElement extends StatefulWidget {
  const ListElement({
    required this.documentItem,
    super.key,
  });
  final DocumentResponceDto documentItem;

  @override
  State<ListElement> createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  @override
  Widget build(BuildContext context) {
    final documentItem = widget.documentItem;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
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
              if (documentItem.byClinic != true)
                ByClinicListElement(
                  documentItem: documentItem,
                ),
              if (documentItem.byClinic != false)
                NotByClinicListElement(
                  documentItem: documentItem,
                ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      DateFormat('MM/dd/yy').format(
                        documentItem.createdAt ?? DateTime.now(),
                      ),
                      style: context.text.sh10w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
