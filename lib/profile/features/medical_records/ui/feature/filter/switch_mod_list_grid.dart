import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../shared/app_assets.dart';
import '../../../../../../shared/theme/themes/_interface/app_theme.dart';
import '../../../data/dto/filter.dart';

class SwitchModListGrid extends StatefulWidget {
  const SwitchModListGrid({
    required this.initial,
    this.onModeChanged,
    super.key,
  });
  final Function(ViewState)? onModeChanged;
  final ViewState initial;

  @override
  State<SwitchModListGrid> createState() => _SwitchModListGridState();
}

class _SwitchModListGridState extends State<SwitchModListGrid> {
  late ViewState _activeButton;

  @override
  void initState() {
    super.initState();
    _activeButton = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: _activeButton == ViewState.grid ? context.button.text5 : context.button.text5Disabled,
            onPressed: () {
              setState(() {
                _activeButton = ViewState.grid;
              });
              widget.onModeChanged?.call(ViewState.grid);
            },
            child: SvgPicture.asset(
              CoreAssets.svg.iGred,
              colorFilter: _activeButton == ViewState.grid
                  ? ColorFilter.mode(
                      context.color.accent,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      context.color.grey900,
                      BlendMode.srcIn,
                    ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: _activeButton == ViewState.list ? context.button.text5 : context.button.text5Disabled,
            onPressed: () {
              setState(() {
                _activeButton = ViewState.list;
              });
              widget.onModeChanged?.call(ViewState.list);
            },
            child: SvgPicture.asset(
              CoreAssets.svg.iList,
              colorFilter: _activeButton == ViewState.list
                  ? ColorFilter.mode(
                      context.color.accent,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      context.color.grey900,
                      BlendMode.srcIn,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
