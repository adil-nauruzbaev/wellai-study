import 'package:flutter/material.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.data,
    super.key,
  });
  final OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (data.imageUrl != null)
          Image.asset(
            data.imageUrl ?? '',
            fit: BoxFit.cover,
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 88, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title ?? '',
                style: context.text.n18w400,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                data.description ?? '',
                style: context.text.n14w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
