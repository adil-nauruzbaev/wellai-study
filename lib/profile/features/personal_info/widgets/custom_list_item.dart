import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/app_assets.dart';
import '../../../../shared/theme/themes/_interface/app_theme.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.text,
    this.onTap,
    this.icon,
    super.key,
  });
  final String? text;
  final VoidCallback? onTap;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.color.borderGrey,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? '',
              // context.s.logOut,
              style: context.text.m16w400,
            ),
            icon ??
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    CoreAssets.svg.iArrowRight,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
