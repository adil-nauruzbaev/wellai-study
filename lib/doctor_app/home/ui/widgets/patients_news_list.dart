import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/l10n/l10n_helper.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

// ignore: must_be_immutable
class PatientsListView extends StatelessWidget {
  PatientsListView({super.key});

  List<String> item = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            ...item.map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: containerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: context.color.background,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  width: 48,
                                  height: 48,
                                  image:
                                      AssetImage(CoreAssets.images.avatarAsset),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Elizabeth Jackson',
                                  style: context.text.s16w600.copyWith(
                                    color: context.color.textPrimary,
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      CoreAssets.svg.iCalandar,
                                      colorFilter: ColorFilter.mode(
                                        context.color.lightGrey,
                                        BlendMode.srcIn,
                                      ),
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 4,
                                        right: 4,
                                      ),
                                      child: Text(
                                        '9:30AM',
                                        style: context.text.s12w500.copyWith(
                                          color: context.color.lightGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 4),
                        child: Text(
                          context.s.symptomsfromassistant,
                          style: context.text.s14w700
                              .copyWith(color: context.color.textPrimary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'Migraine Syndrome, Headache, Insomnia...',
                          style: context.text.s14w400
                              .copyWith(color: context.color.greyText),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: context.button.elevated3,
                              child: Text(
                                context.s.showpatientscard,
                                style: context.text.s14w700
                                    .copyWith(color: context.color.background),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
