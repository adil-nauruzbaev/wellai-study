import 'package:flutter/material.dart';
import '../../../../../../../shared/app_assets.dart';
import '../../../../../../../shared/navigator/navigator1_helper.dart';
import '../../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../../medical_records_screen.dart';
import '/shared/l10n/l10n_helper.dart';

class DialogDocumentSuccesfullUploaded extends StatelessWidget {
  const DialogDocumentSuccesfullUploaded({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: const EdgeInsets.fromLTRB(20, 28, 29, 24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Container(
        alignment: Alignment.center,
        height: 108,
        width: 108,
        child: Image.asset(CoreAssets.images.successDocumentUploaded), //TODO не получаеться коректно скачать фаил в свг формате хз
        // child: SvgPicture.asset(
        //   CoreAssets.svg.imagiSuccessDocumentUp,
        // ),
      ),
      content: SingleChildScrollView(
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            context.s.yourDocumentHasBeenSuccessfullyUploaded,
            style: context.text.m18w400,
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: context.button.elevated1,
                  onPressed: () {
                    context.rootRouter.use.push(const MedicalRecordsScreen());
                  },
                  child: Text(context.s.okay),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
