import 'package:flutter/material.dart';
import '../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';
import 'ui/history_list.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
          child: Text(
            context.s.history,
            style: context.text.m24w400,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: context.color.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.color.shadow),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const HistoryList(),
    );
  }
}
