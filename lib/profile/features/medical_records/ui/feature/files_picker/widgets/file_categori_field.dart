import 'package:flutter/material.dart';
import '../../../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../data/dto/documents_dto.dart';
import 'chategory_select_screen.dart';

class CategoryTextField extends StatelessWidget {
  CategoryTextField({required this.onCheange, super.key});
  final Function(CategoryDto) onCheange;
  final fileCategoryField = AppTextfield(
    data: AppTextfieldData(
      enabled: false,
      hintText: S.current.chooseTheCategory2,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final result = await Navigator.push<CategoryDto>(
          context,
          MaterialPageRoute(
            builder: (context) => const CategorySelectSceen(),
          ),
        );
        if (result != null) {
          fileCategoryField.data.controller.text = result.name ?? '';
          onCheange(result);
        }
      },
      child: fileCategoryField,
    );
  }
}
