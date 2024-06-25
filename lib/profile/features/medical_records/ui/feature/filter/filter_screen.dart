import 'package:flutter/material.dart';
import '../../../../../../shared/navigator/navigator1_helper.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/text_fields/date_time_textfield.dart';
import '../../../data/dto/filter.dart';
import 'selectable_list_of_category_multiple.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../widgets/custom_app_bar_for_medical_records.dart';
import 'switch_mod_list_grid.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    required this.initial,
    super.key,
  });

  final FilterDTO initial;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late final DateTimeTextfield dataFieldFrom;

  late final DateTimeTextfield dataFieldTo;

  late FilterDTO filter;
  @override
  void initState() {
    filter = widget.initial;
    dataFieldFrom = DateTimeTextfield(
      data: DateTimeTextfieldData(
          onChanged: (p0) {
            filter = filter.copyWith(dataFrom: p0);
          },
          hintText: 'hint'),
    );

    dataFieldTo = DateTimeTextfield(
      data: DateTimeTextfieldData(
        onChanged: (p0) {
          filter = filter.copyWith(dataTo: p0);
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.filter,
        ),
      ),
      body: Column(
        children: [
          ColoredBox(
            color: context.color.background,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Text(
                    context.s.chooseState,
                    style: context.text.m18w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            color: context.color.background,
            child: SwitchModListGrid(
              initial: widget.initial.state ?? ViewState.grid,
              onModeChanged: (mode) {
                filter = filter.copyWith(state: mode);
              },
            ),
          ),
          const SizedBox(height: 16),
          ColoredBox(
            color: context.color.background,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Text(
                    context.s.chooseTheCategory,
                    style: context.text.m18w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  color: context.color.background,
                  child: MultipleSelectableListOfCatgory(
                    initial: filter.categories ?? [],
                    onSelectionChanged: (selectedCategories) {
                      filter = filter.copyWith(
                        categories: selectedCategories,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ColoredBox(
            color: context.color.background,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.right,
                      context.s.chooseTheDate,
                      style: context.text.m18w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: dataFieldTo),
                      const SizedBox(width: 12),
                      Expanded(child: dataFieldFrom),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: context.color.background,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.button.elevated1,
                    onPressed: () {
                      context.rootRouter.pop(filter);
                    },
                    child: Text(
                      context.s.continuee,
                      style: context.text.n16w400,
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
