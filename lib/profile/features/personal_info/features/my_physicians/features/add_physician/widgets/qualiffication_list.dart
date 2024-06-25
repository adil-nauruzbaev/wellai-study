import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/app_error_widget.dart';
import '../../../../../../../../shared/init/core_d_i.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../../../shared/widgets/round_ceckbox.dart';
import '../data/bloc/bloc.dart';
import '../data/dto/qualifification_dto.dart';

class ListOfQualofifications extends StatefulWidget {
  const ListOfQualofifications({
    required this.onSelectionChanged,
    super.key,
    this.initial,
  });
  final Function(QualifificationDTO?) onSelectionChanged;
  final QualifificationDTO? initial;
  @override
  State<ListOfQualofifications> createState() => _ListOfQualofificationsState();
}

class _ListOfQualofificationsState extends State<ListOfQualofifications> {
  QualifificationDTO? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initial;
  }

  void _handleTap(QualifificationDTO qualifification) {
    setState(() {
      if (selectedItem == qualifification) {
        selectedItem = null;
      } else {
        selectedItem = qualifification;
      }
      widget.onSelectionChanged(selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QualifificationBloc, QualifificationState>(
      bloc: CoreDi.get(),
      builder: (context, state) {
        if (state is QualifificationError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () => CoreDi.get<QualifificationBloc>().add(
              FetchQualiffication(),
            ),
          );
        }
        if (state is QualifificationLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is QualifificationData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.qualifificationsBloc.length,
            itemBuilder: (BuildContext context, int index) {
              final qualifification = state.qualifificationsBloc[index];
              final isSelected = selectedItem == qualifification;
              return GestureDetector(
                onTap: () => _handleTap(qualifification),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      RoundCheckbox(
                        isChecked: isSelected,
                        onChanged: (bool value) => _handleTap(qualifification),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        qualifification.name ?? '',
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
