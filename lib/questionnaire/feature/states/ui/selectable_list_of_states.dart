import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/app_error_widget.dart';
import '../../../../shared/init/core_d_i.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../shared/widgets/round_ceckbox.dart';
import '../data/bloc/bloc.dart';

class SelectableListOfState extends StatefulWidget {
  const SelectableListOfState({
    required this.stateTextController,
    super.key,
  });
  final TextEditingController stateTextController;

  @override
  State<SelectableListOfState> createState() => _SelectableListOfStateState();
}

class _SelectableListOfStateState extends State<SelectableListOfState> {
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    CoreDi.get<StatesUsBloc>().add(const StatesUsFetch());
  }

  void _updateTextController() {
    widget.stateTextController.text = selectedItem ?? '';
  }

  void _handleTap(String item) {
    setState(() {
      if (selectedItem == item) {
        selectedItem = null;
      } else {
        selectedItem = item;
      }
      _updateTextController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatesUsBloc, StatesUsState>(
      bloc: CoreDi.get(),
      builder: (context, state) {
        if (state is StatesUsError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () =>
                CoreDi.get<StatesUsBloc>().add(const StatesUsFetch()),
          );
        }
        if (state is StatesUsLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is StatesUsData) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _handleTap(state.data[index]),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: <Widget>[
                      RoundCheckbox(
                        isChecked: selectedItem == state.data[index],
                        onChanged: (bool value) {
                          _handleTap(state.data[index]);
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        state.data[index],
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
