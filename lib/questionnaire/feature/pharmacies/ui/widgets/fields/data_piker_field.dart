import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../shared/app_assets.dart';
import '../../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class DataPikerField extends StatefulWidget {
  const DataPikerField({super.key});

  @override
  State<DataPikerField> createState() => _DataPikerFieldState();
}

class _DataPikerFieldState extends State<DataPikerField> {
  final TextEditingController _dateController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: _dateController,
      decoration: InputDecoration(
        hintText: context.s.MMDDYYYY,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.color.grey300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.color.accent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.color.error),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              CoreAssets.svg.iCalandar,
              colorFilter: ColorFilter.mode(
                context.color.grey700,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      readOnly: true,
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null && picked != DateTime.now()) {
          setState(() {
            _dateController.text = '${picked.day}.${picked.month}.${picked.year}';
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
