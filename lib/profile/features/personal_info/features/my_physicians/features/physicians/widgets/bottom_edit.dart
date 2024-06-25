import 'package:flutter/material.dart';
import '../../../../../../../../shared/init/core_d_i.dart';
import '../../../../../../../../shared/navigator/navigator1_helper.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/bloc.dart';
import '../data/physicians_dto.dart';
import '/shared/l10n/l10n_helper.dart';
import 'delete_alert_phys.dart';
import 'edit_physician_screen.dart';

Future<PhysiciansDTO?> physEdittBottomSheet(
  BuildContext context,
  PhysiciansDTO physicianItem,
) {
  return showModalBottomSheet<PhysiciansDTO>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BottomEditPhys(
      physicianItem: physicianItem,
    ),
  );
}

class BottomEditPhys extends StatelessWidget {
  const BottomEditPhys({required this.physicianItem, super.key});
  final PhysiciansDTO physicianItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.rootRouter.use.push(
                    EditPhysicianScreen(physicianItem: physicianItem),
                  );
                },
                child: Text(
                  'Edit physician',
                  style: context.text.g16w400,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  final bloc = CoreDi.get<PhysiciansBloc>();
                  final result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const DeleteAlertPhys();
                    },
                  );
                  if (result == true && physicianItem.id != null) {
                    bloc.add(DeletePhysicians(physicianItem.id!));
                  }
                },
                child: Text(
                  'Delete physician',
                  style: context.text.error16w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.s.cancel,
                  style: context.text.g16w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
