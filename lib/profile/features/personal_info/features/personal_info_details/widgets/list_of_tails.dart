import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../questionnaire/feature/pharmacies/ui/widgets/fields/pharmacy_tile.dart';
import '../../../../../../questionnaire/feature/states/ui/state_tile.dart';
import '../../../../../../shared/init/core_d_i.dart';
import '../../../../../../shared/widgets/text_fields/date_time_textfield.dart';
import '../../../data/bloc/bloc.dart';
import '../../../data/dto/patch_info_dto.dart';
import '../../../data/dto/profile_info_dto.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../../../../../shared/widgets/text_fields/email_textfield.dart';
import '../../../../../../shared/widgets/text_fields/phone_textfield.dart';
import 'biological_sex_2_fild.dart';

class ListOfTails extends StatefulWidget {
  const ListOfTails({
    required this.profileInfoDTO,
    super.key,
  });
  final ProfileInfoDTO? profileInfoDTO;
  @override
  State<ListOfTails> createState() => _ListOfTailsState();
}

class _ListOfTailsState extends State<ListOfTails> {
  String? selectedBiologicalSex;
  String? selectedState;
  String? selectedPharmacyName;
  DateTime? modDateOfBirth;
  late final AppTextfield firstName;
  late final AppTextfield lastName;
  late final DateTimeTextfield dateOfBirth;
  late final EmailTextfield email;
  late final PhoneTextfield phone;
  late final AppTextfield city;
  late final PhoneTextfield pharmacyPhone;
  late final AppTextfield arddres1;
  late final AppTextfield arddres2;
  late final AppTextfield zipCodeField;
  late final AppTextfield myClinic;
  late final AppTextfield alergies;
  @override
  void initState() {
    super.initState();
    firstName = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.firstName,
        initial: widget.profileInfoDTO!.profile!.firstName ?? '',
      ),
    );
    lastName = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.lastName,
        initial: widget.profileInfoDTO!.profile!.lastName ?? '',
      ),
    );
    dateOfBirth = DateTimeTextfield(
      data: DateTimeTextfieldData(
        hintText: S.current.dateOfBirth,
        initial: widget.profileInfoDTO!.profile!.dateOfBirth != null
            ? DateFormat('dd.MM.yyyy').format(
                widget.profileInfoDTO!.profile!.dateOfBirth!,
              )
            : '',
        onChanged: (p0) {
          modDateOfBirth = p0;
        },
      ),
    );
    email = EmailTextfield(
      data: EmailTextfieldData(
        hintText: S.current.email,
        initial: widget.profileInfoDTO!.email ?? '',
      ),
    );
    phone = PhoneTextfield(
      data: PhoneTextfieldData(
        hintText: S.current.phone,
        initial: widget.profileInfoDTO!.profile!.phone ?? '',
      ),
    );
    city = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.city,
        initial: widget.profileInfoDTO!.profile!.city ?? '',
      ),
    );

    pharmacyPhone = PhoneTextfield(
      data: PhoneTextfieldData(
        hintText: S.current.pharmacyPhone,
        initial: widget.profileInfoDTO!.profile!.pharmacyPhone ?? '',
      ),
    );

    arddres1 = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.address,
        initial: widget.profileInfoDTO!.profile!.streetAddress ?? '',
      ),
    );
    arddres2 = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.address2,
        initial: widget.profileInfoDTO!.profile!.streetAddress2 ?? '',
      ),
    );
    zipCodeField = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.zipCode,
      ),
    );
    myClinic = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.myClinic,
      ),
    );
    alergies = AppTextfield(
      data: AppTextfieldData(
        hintText: S.current.alergies,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 28),
              Text(
                context.s.generalInformation,
                style: context.text.m16w400,
              ), //First Name
              const SizedBox(height: 10),
              Text(
                context.s.firstName,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              firstName,
              //Last Name
              const SizedBox(height: 16),
              Text(
                context.s.lastName,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              lastName,
              //Date of Birth
              const SizedBox(height: 16),
              Text(
                context.s.dateOfBirth,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              dateOfBirth,
              //Biological Sex
              const SizedBox(height: 16),
              Text(
                context.s.biologicalSex,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              DropdownChooseSex(
                initialValue: widget.profileInfoDTO!.profile!.biologicalSex ?? '',
                onChanged: (newValue) {
                  setState(() {
                    selectedBiologicalSex = newValue;
                  });
                },
              ),
              //Alergies
              const SizedBox(height: 16),
              Text(
                context.s.alergies,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              alergies,
              const SizedBox(height: 28),
              Text(
                context.s.contactInformation,
                style: context.text.m16w400,
              ),
              const SizedBox(height: 10),
              Text(
                context.s.email,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              email,
              const SizedBox(height: 16),
              Text(
                context.s.phone,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              phone,
              const SizedBox(height: 16),
              Text(
                context.s.address,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              arddres1,
              const SizedBox(height: 16),
              Text(
                context.s.address2,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              arddres2,
              const SizedBox(height: 16),
              Text(
                context.s.city,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              city,
              const SizedBox(height: 16),
              Text(
                context.s.state,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              StateTextField(
                initial: widget.profileInfoDTO!.profile!.state ?? '',
                onSelected: (selectedState) {
                  setState(() {
                    this.selectedState = selectedState;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                context.s.zipCode,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              zipCodeField,
              const SizedBox(height: 16),
              Text(
                context.s.pharmacyName,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              PharmacyTextField(
                initial: widget.profileInfoDTO!.profile!.pharmacyName ?? '',
                onSelected: (selectedPharmacyName) {
                  setState(() {
                    this.selectedPharmacyName = selectedPharmacyName;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                context.s.pharmacyPhone,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              pharmacyPhone,
              const SizedBox(height: 16),
              Text(
                context.s.myClinic,
                style: context.text.sbGT14w400,
              ),
              const SizedBox(height: 8),
              myClinic,
              const SizedBox(height: 16),
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
                    final patchInfoDTO = PatchInfoDTO(
                      firstName: firstName.data.controller.text,
                      lastName: lastName.data.controller.text,
                      dateOfBirth: modDateOfBirth,
                      biologicalSex: selectedBiologicalSex,
                      chronicDiseasesAndAllergies: alergies.data.controller.text,
                      city: city.data.controller.text,
                      diagnosis: widget.profileInfoDTO?.profile?.diagnosis ?? [],
                      // driverLicenseFrontImage
                      driverLicenseFrontImageId: 1,
                      id: widget.profileInfoDTO!.id,
                      //image: '', TODO
                      insuranceBackImageId: 1,
                      insuranceFrontImageId: 1,
                      medications: widget.profileInfoDTO?.profile?.medications ?? '',
                      pharmacyAddress: widget.profileInfoDTO?.profile?.pharmacyAddress ?? '',
                      pharmacyName: selectedPharmacyName,
                      pharmacyPhone: pharmacyPhone.data.controller.text,
                      phone: phone.data.controller.text,
                      preferredName: widget.profileInfoDTO?.profile?.preferredName ?? '',
                      profileWasFilled: true,
                      state: selectedState,
                      streetAddress2: arddres2.data.controller.text,
                      streetAddress: arddres1.data.controller.text,
                      tags: widget.profileInfoDTO?.profile?.diagnosis ?? [],
                      userId: widget.profileInfoDTO!.id,
                      zipCode: zipCodeField.data.controller.text,
                    );
                    CoreDi.get<PersonalInfoBloc>().add(
                      PatchPersonalInfo(
                        patchInfoDTO,
                        widget.profileInfoDTO?.id ?? 0,
                      ),
                    );
                  },
                  child: Text(
                    context.s.save,
                    style: context.text.n16w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
