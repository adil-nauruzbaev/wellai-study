import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/app_assets.dart';
import '../../shared/theme/themes/_interface/app_theme.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.text,
    this.textStyle,
    this.onTap,
    this.icon,
    super.key,
  });
  final String? text;
  final TextStyle? textStyle;
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

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      // This bool value toggles the switch.
      value: light,
      activeColor: context.color.accent,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
