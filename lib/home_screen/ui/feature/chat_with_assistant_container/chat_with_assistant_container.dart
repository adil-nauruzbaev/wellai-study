import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/app_assets.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';
import '/shared/l10n/l10n_helper.dart';

class ChatWithAssistentContainer extends StatelessWidget {
  const ChatWithAssistentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.color.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(CoreAssets.svg.elippseGroup),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.s.howAreYouFeeling,
                            textAlign: TextAlign.left,
                            style: context.text.ssb16w400,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            context.s.tellTheAssistantWhat,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: context.text.gDGn14w400,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      height: 92,
                      width: 92,
                      child: Image.asset(
                        CoreAssets.images.greeanMikeHome,
                      ), //TO надо убрать фон у картинки
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: context.button.elevated1,
                        onPressed: () {},
                        child: Text(
                          context.s.continuee,
                          style: context.text.n16w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
