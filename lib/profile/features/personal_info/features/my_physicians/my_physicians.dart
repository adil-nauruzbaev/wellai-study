import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// import '../../../../../questionnaire/feature/pharmacies/data/bloc/bloc.dart';
import '../../../../../shared/app_assets.dart';
import '../../../../../shared/init/core_d_i.dart';
import '../../../../../shared/navigator/navigator1_helper.dart';
import '../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';
import '/shared/l10n/l10n_helper.dart';

import 'features/add_physician/add_physician.dart';
import 'features/add_physician/data/dto/filte_phys_dto.dart';
// import 'features/add_physician/widgets/sort_phys.dart';
import 'features/physicians/data/bloc/bloc.dart';
import 'features/physicians/physician_list.dart';

class MyPhysicians extends StatefulWidget {
  const MyPhysicians({super.key});

  @override
  State<MyPhysicians> createState() => MyPhysiciansState();
}

class MyPhysiciansState extends State<MyPhysicians> {
  @override
  void initState() {
    CoreDi.get<PhysiciansBloc>().add(FetchPhysicians());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: CustomAppBarForMedicalRecords(
          elevation: 1,
          title: context.s.myPhysicians,
          actions: const [
            // IconButtons(
            //   // onFilterPressed: () async {
            //   //   final result = await Navigator.push<FilterPhysDTO>(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //       builder: (context) => FilterScreen(
            //   //         initial: filter,
            //   //       ),
            //   //     ),
            //   //   );

            //   //   if (result != null) {
            //   //     filter = filter.copyWith(
            //   //       state: result.state,
            //   //       categories: result.categories,
            //   //       dataFrom: result.dataFrom,
            //   //       dataTo: result.dataTo,
            //   //     );
            //   //     setState(() {});
            //   //     CoreDi.get<PhysiciansBloc>().add(
            //   //       FetchPhysicians(filter),
            //   //     );
            //   //   }
            //   // },
            //   // currentPhysFilter: null,
            //   // onSortPysChanged: (FilterPhysDTO filterPhyDTO) {},
            // ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Expanded(child: PhysicianList()),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.button.elevated1,
                    onPressed: () {
                      context.rootRouter.use.push(const AddPhysician());
                    },
                    child: Text(
                      context.s.addPhysician,
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

class IconButtons extends StatefulWidget {
  const IconButtons({
    required this.onFilterPressed,
    required this.currentPhysFilter,
    required this.onSortPysChanged,
    super.key,
  });
  final VoidCallback onFilterPressed;
  final FilterPhysDTO currentPhysFilter;
  final Function(FilterPhysDTO filterPhyDTO) onSortPysChanged;

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          // onFilterPressed,
          icon: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              CoreAssets.svg.iFilter,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          // async {
          //   final updatedFilter = await showSorPhystBottomSheet(
          //     context
          //    currentPhysFilter,
          //   );
          //   if (updatedFilter != null) {
          //    onSortPysChanged(updatedFilter);
          //   }
          // },
          icon: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              CoreAssets.svg.iSorte,
              colorFilter: ColorFilter.mode(
                context.color.shadow,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
