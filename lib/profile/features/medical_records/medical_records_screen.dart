import 'package:flutter/material.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/generated/l10n.dart';
import '../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import 'data/bloc/documents_model_bloc/bloc.dart';
import 'data/dto/filter.dart';
import 'ui/feature/files_picker/widgets/files_picker.dart';
import 'ui/feature/grid_list_modifaer/grid_list_modifaier.dart';
import 'ui/widgets/custom_app_bar_for_medical_records.dart';
import 'ui/feature/filter/filter_screen.dart';
import 'ui/widgets/search_bar/search_bar.dart';
import '/shared/l10n/l10n_helper.dart';
import 'ui/widgets/select_category/selected_category_list.dart';

class MedicalRecordsScreen extends StatefulWidget {
  const MedicalRecordsScreen({super.key});

  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  FilterDTO filter = FilterDTO(
    state: ViewState.grid,
  );

  @override
  Widget build(BuildContext context) {
    final search = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.search,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 0,
          title: context.s.medicalRecords,
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () async {
                final result = await Navigator.push<FilterDTO>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(
                      initial: filter,
                    ),
                  ),
                );

                if (result != null) {
                  filter = filter.copyWith(
                    state: result.state,
                    categories: result.categories,
                    dataFrom: result.dataFrom,
                    dataTo: result.dataTo,
                  );
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SearchBarAndIcons(
            search: search,
            onFilterPressed: () async {
              final result = await Navigator.push<FilterDTO>(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterScreen(
                    initial: filter,
                  ),
                ),
              );

              if (result != null) {
                filter = filter.copyWith(
                  state: result.state,
                  categories: result.categories,
                  dataFrom: result.dataFrom,
                  dataTo: result.dataTo,
                );
                setState(() {});
                CoreDi.get<DocumentlBloc>().add(
                  FetchDocument(filter),
                );
              }
            },
            onSortChanged: (filterDTO) {
              filter = filter.copyWith(
                sort: filterDTO.sort,
              );
              setState(() {});
              CoreDi.get<DocumentlBloc>().add(
                FetchDocument(filter),
              );
            },
            currentFilter: filter,
          ),
          SelectedCategoryList(
            onDelete: (category) {
              final index = filter.categories?.indexWhere(
                (element) => element == category,
              );

              filter.categories?.removeAt(index ?? 0);
              setState(() {});
              CoreDi.get<DocumentlBloc>().add(
                FetchDocument(filter),
              );
            },
            selectedCategories: filter.categories ?? [],
          ),
          GridListModifaer(filter: filter),
          const FilesPicker(),
        ],
      ),
    );
  }
}
