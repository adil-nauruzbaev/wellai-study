import 'package:flutter/material.dart';
import '../../../shared/init/core_d_i.dart';
import '../../../shared/l10n/generated/l10n.dart';
import '../../../shared/theme/themes/_interface/app_theme.dart';
import '../data/bloc/clinic_news/news_bloc.dart';
import 'widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    CoreDi.get<NewsDoctorBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: AppBar(
        title: Text(
          S.of(context).clinicNews,
          style:
              context.text.s18w500.copyWith(color: context.color.textPrimary),
        ),
        backgroundColor: context.color.background,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: context.color.textPrimary,
          ),
        ),
      ),
      body: NewsListView(),
    );
  }
}
