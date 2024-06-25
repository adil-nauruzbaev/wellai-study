import 'package:flutter/material.dart';
import '../../../../../../shared/l10n/generated/l10n.dart';
import '../../../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import '../state_select_screen.dart';

class StateTextField extends StatefulWidget {
  const StateTextField({
    super.key,
    this.initial,
    this.onSelected,
  });
  final String? initial;
  final Function(String)? onSelected;
  @override
  State<StateTextField> createState() => _StateTextFieldState();
}

class _StateTextFieldState extends State<StateTextField> {
  late final AppTextfield stateField;

  @override
  void initState() {
    stateField = AppTextfield(
      data: AppTextfieldData(
        initial: widget.initial,
        //prefixIcon: Icons.arrow_forward_ios_rounded,//SvgPicture.asset(CoreAssets.svg.iChatLight),
        enabled: false,
        hintText: S.current.state,
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
            builder: (context) => const StateSelectSceen(),
          ),
        );

        if (result != null) {
          stateField.data.controller.text = result;
          widget.onSelected!(result);
        }
      },
      child: stateField,
    );
  }
}
