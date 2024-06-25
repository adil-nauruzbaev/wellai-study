import 'package:flutter/material.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../data/dto/documents_dto.dart';
import '../../../widgets/custom_app_bar_for_medical_records.dart';
import '../../../widgets/select_category/selectable_list_of_category.dart';
import '/shared/l10n/l10n_helper.dart';

class CategorySelectSceen extends StatefulWidget {
  const CategorySelectSceen({super.key});

  @override
  State<CategorySelectSceen> createState() => _CategorySelectSceenState();
}

class _CategorySelectSceenState extends State<CategorySelectSceen> {
  CategoryDto? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.documentCategory,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 32),
                Text(
                  context.s.chooseTheCategory,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 16),
                SingleSelectableListOfCategory(
                  onSelectionChanged: (CategoryDto? category) {
                    this.category = category;
                  },
                  initial: null,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.color.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      style: context.button.elevated1,
                      onPressed: () {
                        Navigator.pop(context, category);
                      },
                      child: Text(
                        context.s.chooseCategory,
                        style: context.text.n16w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
