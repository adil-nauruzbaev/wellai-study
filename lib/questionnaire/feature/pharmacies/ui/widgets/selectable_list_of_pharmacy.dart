import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/app_error_widget.dart';
import '../../../../../shared/init/core_d_i.dart';
import '../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../shared/widgets/round_ceckbox.dart';
import '../../data/bloc/bloc.dart';

class SelectableListOfPharmacy extends StatefulWidget {
  const SelectableListOfPharmacy({
    required this.pharmacyTextController,
    super.key,
  });
  final TextEditingController pharmacyTextController;

  @override
  State<SelectableListOfPharmacy> createState() =>
      _SelectableListOfPharmacyState();
}

class _SelectableListOfPharmacyState extends State<SelectableListOfPharmacy> {
  String? selectedItem;

  void _updateTextController() {
    widget.pharmacyTextController.text = selectedItem ?? '';
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
  void initState() {
    CoreDi.get<PharmaciesBloc>().add(const PharmaciesFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmaciesBloc, PharmaciesState>(
      bloc: CoreDi.get(),
      builder: (context, state) {
        if (state is PharmaciesError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () {
              CoreDi.get<PharmaciesBloc>().add(const PharmaciesFetch());
            },
          );
        }
        if (state is PharmaciesLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is PharmaciesData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
