import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../shared/app_error_widget.dart';
import '../../../../../../../../shared/init/core_d_i.dart';
import '../../../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../../../../../shared/widgets/text_fields/phone_textfield.dart';
import '../../../../../data/bloc/bloc.dart';
import '../../add_physician/widgets/qualififcation_field.dart';
import '../data/bloc/bloc.dart';
import '../data/physician_patch_dto.dart';
import '../data/physicians_dto.dart';
// import '/shared/l10n/l10n_helper.dart';
import '../../../../../../medical_records/ui/widgets/custom_app_bar_for_medical_records.dart';

class EditPhysicianScreen extends StatefulWidget {
  const EditPhysicianScreen({required this.physicianItem, super.key});
  final PhysiciansDTO physicianItem;
  @override
  State<EditPhysicianScreen> createState() => _EditPhysicianScreenState();
}

class _EditPhysicianScreenState extends State<EditPhysicianScreen> {
  int? selectedQualifficationId;
  late final AppTextfield physicianName;
  late final PhoneTextfield physicianPhone;
  late final AppTextfield wbsite;

  @override
  void initState() {
    super.initState();
    physicianName = AppTextfield(
      data: AppTextfieldData(
        initial: widget.physicianItem.doctorFullName,
        hintText: S.current.name,
      ),
    );
    physicianPhone = PhoneTextfield(
      data: PhoneTextfieldData(
        initial: widget.physicianItem.phone,
        hintText: S.current.phone,
      ),
    );
    wbsite = AppTextfield(
      data: AppTextfieldData(
        initial: widget.physicianItem.link,
        hintText: S.current.website,
      ),
    );

    selectedQualifficationId = widget.physicianItem.specialityId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 1),
        child: CustomAppBarForMedicalRecords(
          elevation: 1, title: 'Edit physician',
          //  title: context.s.editPhysician,
        ),
      ),
      body: BlocConsumer<PhysiciansBloc, PhysiciansState>(
        bloc: CoreDi.get(),
        listener: (BuildContext context, Object? state) {
          if (state is PhysiciansPatchSuccesc) {
            Navigator.of(context).pop();
            CoreDi.get<PhysiciansBloc>().add(FetchPhysicians());
          }
        },
        builder: (BuildContext context, state) {
          if (state is PhysiciansLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhysiciansError) {
            return AppErrorWidget(message: state.error);
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 24),
                    physicianName,
                    const SizedBox(height: 16),
                    Qualififcation(
                      initial: widget.physicianItem.speciality?.name ?? '',
                      onCheange: (qualififcationDto) {
                        selectedQualifficationId = qualififcationDto.id;
                      },
                    ),
                    const SizedBox(height: 16),
                    physicianPhone,
                    const SizedBox(height: 16),
                    wbsite,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: context.button.elevated1,
                        onPressed: () {
                          final patchPhysDTO = PhysicianPatchDTO(
                            profileId:
                                (CoreDi.get<PersonalInfoBloc>().state as PersonalInfoData).personalInfo.profile?.id,
                            id: widget.physicianItem.id ?? 0,
                            doctorFullName: physicianName.data.controller.text,
                            link: wbsite.data.controller.text,
                            phone: physicianPhone.data.controller.text,
                            specialityId: selectedQualifficationId,
                          );
                          CoreDi.get<PhysiciansBloc>().add(
                            EditPhysicians(
                              widget.physicianItem.id ?? 0,
                              patchPhysDTO,
                            ),
                          );
                        },
                        child: Text(
                          'Save changes',
                          // context.s.save,
                          style: context.text.n16w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
