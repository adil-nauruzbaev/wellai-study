import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../doctor_app/root/doc_root_screen.dart';
import '../navigation/root_screen.dart';
import '../profile/features/personal_info/data/bloc/bloc.dart';
import '../shared/init/core_d_i.dart';
import '../shared/navigator/navigator1_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CoreDi.get<PersonalInfoBloc>().add(FetchPersonalInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
      bloc: CoreDi.get(),
      listener: (context, state) {
        if (state is PersonalInfoData) {
<<<<<<< HEAD
          if (state.personalInfo.roles?.first.prefix == 'docto') {
=======
          if (state.personalInfo.roles?.first.prefix == 'doctor') {
>>>>>>> 4638a1316d5b036fd7008c71553198ad83d36fe2
            context.rootRouter.use.push(const DocRootScreen());
          } else {
            context.rootRouter.use.push(const RootScreen());
          }
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
