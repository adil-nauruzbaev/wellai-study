import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../shared/app_assets.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto/documents_dto.dart';

class SelectedCategoryList extends StatelessWidget {
  const SelectedCategoryList({
    required this.selectedCategories,
    required this.onDelete,
    super.key,
  });

  final List<CategoryDto> selectedCategories;
  final Function(CategoryDto) onDelete;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectedCategories.map((category) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            child: Chip(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: context.color.accent),
              ),
              label: Text(
                category.name ?? '',
                style: context.text.ac14w400,
              ),
              onDeleted: () => onDelete(category),
              deleteIcon: SvgPicture.asset(
                CoreAssets.svg.idismiss,
                colorFilter: ColorFilter.mode(
                  context.color.accent,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
