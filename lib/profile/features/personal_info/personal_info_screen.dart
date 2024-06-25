import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../settings/widgets/custom_list_item.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/navigator/navigator1_helper.dart';
import '../medical_records/medical_records_screen.dart';
import '/shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import 'data/bloc/bloc.dart';
import 'features/my_documents/my_documents_screen.dart';

import 'features/my_physicians/my_physicians.dart';
import 'widgets/avatar.dart';
import 'features/personal_info_details/personal_info_details.dart';

class ProfilePersonalInfoScreen extends StatefulWidget {
  const ProfilePersonalInfoScreen({super.key});

  @override
  State<ProfilePersonalInfoScreen> createState() => _ProfilePersonalInfoScreenState();
}

class _ProfilePersonalInfoScreenState extends State<ProfilePersonalInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: context.color.background,
        title: Text(context.s.profile, style: context.text.m24w400),
      ),
      body: BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        bloc: CoreDi.get<PersonalInfoBloc>(),
        builder: (context, state) {
          if (state is PersonalInfoLoading) {
            return const Column(
              children: [
                SizedBox(height: 4),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 12),
              ],
            );
          }
          if (state is PersonalInfoData) {
            final personalInfo = state.personalInfo;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 4),
                    ProfileAvatar(profileInfoDTO: personalInfo),
                    const SizedBox(height: 12),
                    Align(
                      child: Text(
                        ' ${personalInfo.profile!.firstName ?? ''} ${personalInfo.profile!.lastName ?? ''}'.trim(),
                        style: context.text.m16w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  context.s.personalInformationS,
                  style: context.text.greyText14w400,
                ),
                CustomListItem(
                  onTap: () {
                    context.rootRouter.use.push(
                      PersonalInfoDetails(
                        imagePath: personalInfo.profile?.image?.path,
                        profileInfoDTO: personalInfo,
                      ),
                    );
                  },
                  text: context.s.personalInfo,
                ),
                CustomListItem(
                  text: context.s.myDocuments,
                  onTap: () {
                    context.rootRouter.use.push(const MyDocumentsScreen());
                  },
                ),
                CustomListItem(
                  onTap: () {
                    context.rootRouter.use.push(const MedicalRecordsScreen());
                  },
                  text: context.s.medicalInformation,
                ),
                CustomListItem(
                  onTap: () {
                    context.rootRouter.use.push(const MyPhysicians());
                  },
                  text: context.s.myPhysicians,
                ),
                const SizedBox(height: 32),
                Text(
                  context.s.accountManagement,
                  style: context.text.greyText14w400,
                ),
                CustomListItem(
                  text: context.s.logOut,
                ),
                CustomListItem(
                  text: context.s.deleteProfile,
                ),
              ],
            );
          }
          if (state is PersonalInfoError) {
            return Center(child: Text(context.s.noData));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
