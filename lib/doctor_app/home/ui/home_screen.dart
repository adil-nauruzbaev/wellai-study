import 'package:flutter/material.dart';
import '../../../shared/l10n/l10n_helper.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../shared/init/core_d_i.dart';
import '../data/bloc/clinic_news/news_bloc.dart';
import 'clinic_news_screen.dart';
import 'widgets/news_list.dart';
import 'widgets/patients_news_list.dart';
import 'widgets/statusbar.dart';

class HomeScreenDoctor extends StatefulWidget {
  const HomeScreenDoctor({super.key});

  @override
  State<HomeScreenDoctor> createState() => _HomeScreenDoctorState();
}

class _HomeScreenDoctorState extends State<HomeScreenDoctor> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<NewsDoctorBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      body: Column(
        children: [
          const StatusBar(),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.s.today,
                  style: context.text.s18w500
                      .copyWith(color: context.color.textPrimary),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    context.s.showAll,
                    style: context.text.s14w500
                        .copyWith(color: context.color.buttonGreen),
                  ),
                ),
              ],
            ),
          ),
          PatientsListView(),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 17,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.s.clinicNews,
                  style: context.text.s18w500
                      .copyWith(color: context.color.textPrimary),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    context.s.showAll,
                    style: context.text.s14w500.copyWith(
                      color: context.color.buttonGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          NewsListView(),
        ],
      ),
    );
  }
}
