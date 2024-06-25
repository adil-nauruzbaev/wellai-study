import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../shared/app_assets.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../data/dto/filter.dart';
import '../document_actions/alert_sort_documents.dart';

class SearchBarAndIcons extends StatelessWidget {
  const SearchBarAndIcons({
    required this.search,
    required this.onFilterPressed,
    required this.currentFilter,
    required this.onSortChanged,
    super.key,
  });
  final AppTextfield search;
  final VoidCallback onFilterPressed;
  final FilterDTO currentFilter;
  final Function(FilterDTO filterDTO) onSortChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: search),
          IconButton(
            onPressed: onFilterPressed,
            icon: SizedBox(
              height: 28,
              width: 28,
              child: SvgPicture.asset(
                CoreAssets.svg.iFilter,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              final updatedFilter = await showSortBottomSheet(context, currentFilter);
              if (updatedFilter != null) {
                onSortChanged(updatedFilter);
              }
            },
            icon: SizedBox(
              height: 28,
              width: 28,
              child: SvgPicture.asset(
                CoreAssets.svg.iSorte,
                colorFilter: ColorFilter.mode(
                  context.color.shadow,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
