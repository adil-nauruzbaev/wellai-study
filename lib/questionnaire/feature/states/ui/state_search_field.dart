import 'package:flutter/material.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.controller,
    required this.onSearchChanged,
    super.key,
  });
  final TextEditingController controller;
  final Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: context.s.stateName,
          prefixIcon: const Icon(Icons.search),
          fillColor: context.color.grey100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
      ),
    );
  }
}
