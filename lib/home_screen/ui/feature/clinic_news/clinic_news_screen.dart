import 'package:flutter/material.dart';

import '../../../../shared/theme/themes/_interface/app_theme.dart';

import 'clinic_news.dart';
import '/shared/l10n/l10n_helper.dart';

class ClinicNewsScreen extends StatelessWidget {
  const ClinicNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundGrey,
      appBar: AppBar(
        backgroundColor: context.color.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.color.shadow),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          context.s.clinicNews,
          style: context.text.m18w400,
        ),
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              sliver: ClinicNews(),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
