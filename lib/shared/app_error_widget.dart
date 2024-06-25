import 'package:flutter/material.dart';

import 'l10n/l10n_helper.dart';
import 'theme/themes/_interface/app_theme.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.message,
    this.onRefresh,
  });

  final String? message;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset('assets/icons_svg/tree.svg'),
          const SizedBox(height: 18),
          Text(message ?? context.s.somethingWentWrong),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onRefresh,
                  style: context.button.elevated1,
                  child: const Text('Retry'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
