import 'package:flutter/material.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../shared/widgets/text_fields/app_textfield/app_textfield.dart';
import 'widgets/selectable_list_of_pharmacy.dart';

class PharmacySelectSceen extends StatefulWidget {
  const PharmacySelectSceen({super.key});

  @override
  State<PharmacySelectSceen> createState() => _PharmacySelectSceenState();
}

class _PharmacySelectSceenState extends State<PharmacySelectSceen> {
  final pharmacyField = AppTextfield(
    data: AppTextfieldData(
      onChanged: (v) {
        //CoreDi.get<Bloc>().add(Search);
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.background,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            context.s.choosePharmacy,
            style: context.text.m18w400,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.color.shadow,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context, pharmacyField.data.controller.text);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 24),
                Text(
                  context.s.ifYourPharmacyIsNotITheList,
                  style: context.text.shadowGr14w400,
                ),
                const SizedBox(height: 12),
                pharmacyField,
                const SizedBox(height: 32),
                Text(
                  context.s.listOfPharmacies,
                  style: context.text.m18w400,
                ),
                const SizedBox(height: 16),
                SelectableListOfPharmacy(
                  pharmacyTextController: pharmacyField.data.controller,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.color.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                      style: context.button.elevated1,
                      onPressed: () {
                        Navigator.pop(context, pharmacyField.data.controller.text);
                      },
                      child: Text(
                        context.s.continuee,
                        style: context.text.n16w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
