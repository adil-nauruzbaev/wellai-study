import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../shared/app_assets.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/categories/category_bloc.dart';
import '../data/dto/categories_model.dart';
import '../data/dto/filter_model.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({required this.filter, super.key});
  FilterModel filter;
  @override
  State<FilterScreen> createState() => _FilterScreenState(filter: filter);
}

class _FilterScreenState extends State<FilterScreen> {
  _FilterScreenState({required this.filter});
  FilterModel filter;
  int selectedContainer = 1;
  int selectedCategory = -1;
  DateTime now = DateTime.now();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  void selectCategory(CategoriesModel value, bool checked) {
    if (checked == true) {
      setState(() {
        filter.categoriesList.add(value);
      });
    } else if (checked == false) {
      setState(() {
        filter.categoriesList.remove(value);
      });
    }
  }

  Future<DateTime> _selectDate(
      BuildContext context, TextEditingController _contr) async {
    var picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _contr.text = DateFormat('yyyy/MM/dd').format(picked);

      setState(() {});
    } else {
      picked = DateTime.now();
    }
    return picked;
  }

  @override
  void initState() {
    CoreDi.get<CategoriesDocBloc>().add(CategoriesFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filter.categoriesList.forEach(
      (element) {
        print(element.name);
      },
    );
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: AppBar(
        backgroundColor: context.color.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: context.color.textPrimary,
              size: 32,
            ),
          ),
        ),
        leadingWidth: 50,
        title: Text(
          context.s.filter,
          style: context.text.s18w500,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: context.color.background,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      context.s.chooseTheMode,
                      style: context.text.s18w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContainer = 1;
                                //filterList.gridList = false;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: selectedContainer == 1
                                          ? context.color.buttonGreen
                                          : context.color.grey700,
                                      width: selectedContainer == 1 ? 2 : 1),
                                  color: context.color.background),
                              child: SvgPicture.asset(
                                CoreAssets.svg.iGred,
                                colorFilter: ColorFilter.mode(
                                  selectedContainer == 1
                                      ? context.color.buttonGreen
                                      : context.color.grey700,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedContainer = 2;
                                //filterList.gridList = true;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: selectedContainer == 2
                                        ? context.color.buttonGreen
                                        : context.color.grey700,
                                    width: selectedContainer == 2 ? 2 : 1),
                                color: context.color.background,
                              ),
                              child: SvgPicture.asset(
                                CoreAssets.svg.iList,
                                colorFilter: ColorFilter.mode(
                                  selectedContainer == 2
                                      ? context.color.buttonGreen
                                      : context.color.grey700,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: context.color.background,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      context.s.chooseCategory,
                      style: context.text.s18w500,
                    ),
                  ),
                  BlocBuilder(
                    bloc: CoreDi.get<CategoriesDocBloc>(),
                    builder: (context, state) {
                      if (state is CategoiesInitial) {
                        return const SizedBox.shrink();
                      }
                      if (state is CategoiesLoading) {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [CircularProgressIndicator()],
                        );
                      }
                      if (state is CategoiesError) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(context.s.errorLoadingCalendar),
                          ],
                        );
                      }
                      if (state is CategoiesData) {
                        final categories = state.data;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            print(
                              filter.categoriesList.contains(categories[index]),
                            );
                            return Row(
                              children: [
                                Checkbox(
                                  value: filter.categoriesList
                                      .contains(categories[index]),
                                  onChanged: (val) {
                                    selectCategory(
                                      categories[index],
                                      val ?? false,
                                    );
                                  },
                                ),
                                Text(categories[index].name ?? ''),
                              ],
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: context.color.background,
              margin: const EdgeInsets.only(top: 16, bottom: 16),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      context.s.chooseTheDate,
                      style: context.text.s18w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: GestureDetector(
                            onTap: () async {
                              filter.startDate =
                                  await _selectDate(context, _from);
                            },
                            child: TextField(
                              controller: _from,
                              enabled: false,
                              style: context.text.s14w400,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: context.color.borderGrey,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    top: 14,
                                    bottom: 14,
                                    right: 8,
                                  ),
                                  child: Text(
                                    context.s.from,
                                    style: context.text.s14w500.copyWith(
                                        color: context.color.greyText),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: GestureDetector(
                            onTap: () async {
                              filter.endDate = await _selectDate(context, _to);
                            },
                            child: TextField(
                              controller: _to,
                              enabled: false,
                              style: context.text.s14w400,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: context.color.borderGrey,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 14, bottom: 14, right: 8),
                                  child: Text(
                                    context.s.to,
                                    style: context.text.s14w500.copyWith(
                                        color: context.color.greyText),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 32,
              ),
              decoration: BoxDecoration(
                color: context.color.background,
                boxShadow: [
                  BoxShadow(
                    color: context.color.shadow.withOpacity(0.08),
                    offset: const Offset(
                      0,
                      -2,
                    ),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, filter);
                      },
                      style: context.button.elevated1,
                      child: Text(
                        context.s.apply,
                        style: context.text.s16w600
                            .copyWith(color: context.color.background),
                      ),
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
/*return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 16),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (index == selectedCategory) {
                                        unselectBox();
                                      } else {
                                        selectBox(
                                          index,
                                          categories[index].name ?? '',
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: index == selectedCategory
                                            ? context.color.buttonGreen
                                            : context.color.background,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: index == selectedCategory
                                              ? context.color.buttonGreen
                                              : context.color.greyText,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: index == selectedCategory
                                            ? context.color.background
                                            : context.color.greyText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(categories[index].name ?? '',
                                        style: context.text.s14w400),
                                  ),
                                ],
                              ),
                            ); */
