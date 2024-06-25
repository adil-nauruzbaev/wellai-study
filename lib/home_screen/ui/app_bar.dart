import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';
import '../data/temp_models.dart';

class AppBarMod extends StatelessWidget {
  const AppBarMod({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 20.0),
      child: AppBar(
        backgroundColor: context.color.background,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(userProfile.photoUrl),
              ),
            ),
          ],
        ),
        title: Text(
          'Hello, ${userProfile.name}!',
          style: context.text.m24w400,
        ),
        actions: [
          SizedBox(
            height: 32,
            width: 32,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(CoreAssets.svg.iNotification),
            ),
          ),
        ],
      ),
    );
  }
}
