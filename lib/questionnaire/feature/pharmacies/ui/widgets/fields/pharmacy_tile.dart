import 'package:flutter/material.dart';
import '../../../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../../pharmacy_select_screen.dart';

class PharmacyTextField extends StatefulWidget {
  const PharmacyTextField({
    super.key,
    this.initial,
    this.onSelected,
  });
  final String? initial;
  final Function(String)? onSelected;
  @override
  State<PharmacyTextField> createState() => _PharmacyTextFieldState();
}

class _PharmacyTextFieldState extends State<PharmacyTextField> {
  late final AppTextfield pharmacyField;

  @override
  void initState() {
    pharmacyField = AppTextfield(
      data: AppTextfieldData(
        initial: widget.initial,
        //prefixIcon: Icons.arrow_forward_ios_rounded,//SvgPicture.asset(CoreAssets.svg.iChatLight),
        enabled: false,
        hintText: S.current.yourPharmacy,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final result = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => const PharmacySelectSceen(),
          ),
        );

        if (result != null) {
          pharmacyField.data.controller.text = result;
          widget.onSelected!(result);
        }
      },
      child: pharmacyField,
    );
  }
}
