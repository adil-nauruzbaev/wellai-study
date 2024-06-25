import 'package:flutter/material.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/generated/l10n.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import 'data/bloc/bloc.dart';
import 'ui/selectable_list_of_states.dart';

class StateSelectSceen extends StatefulWidget {
  const StateSelectSceen({super.key});

  @override
  State<StateSelectSceen> createState() => _StateSelectSceenState();
}

class _StateSelectSceenState extends State<StateSelectSceen> {
  final searchField = AppTextfield(
    data: AppTextfieldData(
      hintText: S.current.stateName,
      onChanged: (v) {
        CoreDi.get<StatesUsBloc>().add(StateSearch(query: v));
      },
    ),
  );

  // String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: context.color.background,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              context.s.chooseState,
              style: context.text.m18w400,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: context.color.shadow,
              size: 32,
            ),
            onPressed: () {
              Navigator.pop(context, searchField.data.controller.text);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: searchField,
          ),
          // SearchField(
          //   controller: searchController,
          //   onSearchChanged: (query) {
          //     setState(() {
          //       searchQuery = query;
          //     });
          //   },
          // ),
          Expanded(
            child: SelectableListOfState(
              stateTextController: searchField.data.controller,
            ),
          ),
          Container(
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.button.elevated1,
                    onPressed: () {
                      Navigator.pop(context, searchField.data.controller.text);
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
