import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/app_error_widget.dart';
import '../../../../../../shared/doc_categories/bloc/bloc.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/round_ceckbox.dart';
import '../../../data/dto/documents_dto.dart';

class SingleSelectableListOfCategory extends StatefulWidget {
  const SingleSelectableListOfCategory({
    required this.onSelectionChanged,
    required this.initial,
    super.key,
  });
  final Function(CategoryDto?) onSelectionChanged;
  final CategoryDto? initial;

  @override
  State<SingleSelectableListOfCategory> createState() => _SingleSelectableListOfCategoryState();
}

class _SingleSelectableListOfCategoryState extends State<SingleSelectableListOfCategory> {
  CategoryDto? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initial;
  }

  void _handleTap(CategoryDto category) {
    setState(() {
      if (selectedItem == category) {
        selectedItem = null;
      } else {
        selectedItem = category;
      }
      widget.onSelectionChanged(selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      bloc: CoreDi.get(),
      builder: (context, state) {
        if (state is CategoriesError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () => CoreDi.get<CategoriesBloc>().add(FetchCategories()),
          );
        }
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is CategoriesData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.documentCategories.length,
            itemBuilder: (context, index) {
              final category = state.documentCategories[index];
              final isSelected = selectedItem == category;

              return GestureDetector(
                onTap: () => _handleTap(category),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      RoundCheckbox(
                        isChecked: isSelected,
                        onChanged: (bool value) => _handleTap(category),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        category.name ?? '',
                        style: context.text.gDGn14w400,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
