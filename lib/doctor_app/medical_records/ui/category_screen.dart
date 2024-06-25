import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/categories/category_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = -1;
  String chosed = '';
  void selectBox(int index, String category) {
    chosed = category;
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    CoreDi.get<CategoriesDocBloc>().add(CategoriesFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          context.s.documentUpload,
          style: context.text.s18w500,
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
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
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: 24, left: 16),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectBox(
                                        index, categories[index].name ?? '');
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: index == selectedIndex
                                          ? context.color.buttonGreen
                                          : context.color.background,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: index == selectedIndex
                                            ? context.color.buttonGreen
                                            : context.color.greyText,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: index == selectedIndex
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
                      Navigator.pop(context, chosed);
                    },
                    style: context.button.elevated1,
                    child: Text(
                      context.s.chooseCategory,
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
    );
  }
}
