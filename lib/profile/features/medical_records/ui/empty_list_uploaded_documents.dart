import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class EmptyListUploadedDocuments extends StatelessWidget {
  const EmptyListUploadedDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CoreAssets.svg.imgEmptyDocumentList),
            const SizedBox(height: 28),
            Text(
              textAlign: TextAlign.center,
              context.s.youDoNotHaveAnyUploadedDocumentsRightNow,
              style: context.text.shadowGr14w400,
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyListDocumentsRequest extends StatelessWidget {
  const EmptyListDocumentsRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CoreAssets.svg.imgEmptyListDocumentsRequest),
            const SizedBox(height: 28),
            Text(
              textAlign: TextAlign.center,
              context.s.weDidNotFindAnythingForYourRequest,
              style: context.text.shadowGr14w400,
            ),
          ],
        ),
      ),
    );
  }
}
