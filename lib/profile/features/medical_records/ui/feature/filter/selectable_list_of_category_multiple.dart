import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/app_error_widget.dart';
import '../../../../../../shared/doc_categories/bloc/bloc.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/round_ceckbox.dart';
import '../../../data/dto/documents_dto.dart';

class MultipleSelectableListOfCatgory extends StatefulWidget {
  const MultipleSelectableListOfCatgory({
    required this.onSelectionChanged,
    required this.initial,
    super.key,
  });
  final Function(List<CategoryDto>) onSelectionChanged;
  final List<CategoryDto> initial;

  @override
  State<MultipleSelectableListOfCatgory> createState() => _MultipleSelectableListOfCatgoryState();
}

class _MultipleSelectableListOfCatgoryState extends State<MultipleSelectableListOfCatgory> {
  final List<CategoryDto> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems.addAll(widget.initial);
  }

  void _handleTap(CategoryDto categoryName) {
    setState(() {
      if (selectedItems.contains(categoryName)) {
        selectedItems.remove(categoryName);
      } else {
        selectedItems.add(categoryName);
      }
      widget.onSelectionChanged(selectedItems);
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
              final isSelected = selectedItems.contains(category);

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
