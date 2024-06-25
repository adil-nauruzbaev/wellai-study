import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../shared/app_error_widget.dart';
import '../../../../../../../shared/init/core_d_i.dart';
// import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import 'data/bloc/bloc.dart';
// import 'data/physicians_dto.dart';
import 'widgets/physician_item.dart';

class PhysicianList extends StatelessWidget {
  const PhysicianList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhysiciansBloc, PhysiciansState>(
      bloc: CoreDi.get<PhysiciansBloc>(),
      builder: (context, state) {
        if (state is PhysiciansLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PhysiciansError) {
          return AppErrorWidget(
            message: state.error,
            onRefresh: () {
              CoreDi.get<PhysiciansBloc>().add(FetchPhysicians());
            },
          );
        }
        if (state is PhysiciansData) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.physicians.length,
            itemBuilder: (BuildContext context, int index) {
              final physicianItem = state.physicians[index];
              return PhysicianItem(physicianItem: physicianItem);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
