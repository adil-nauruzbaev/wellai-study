import 'package:flutter/material.dart';

import '../../../../../../shared/theme/themes/_interface/app_theme.dart';

class AlergiesSelectableButtonsList extends StatefulWidget {
  const AlergiesSelectableButtonsList({
    required this.onTap,
    super.key,
  });

  final Function(String) onTap;

  @override
  State<AlergiesSelectableButtonsList> createState() =>
      _AlergiesSelectableButtonsListState();
}

class _AlergiesSelectableButtonsListState
    extends State<AlergiesSelectableButtonsList> {
  final List<String> _buttons = [
    'Кнопка 1',
    'Кнопка 2',
    'Кнопка 3',
    'Кнопка 4',
    'Кнопка 5',
    'Кнопка 6',
  ];
  List<bool> _selectedButtons = [];

  @override
  void initState() {
    super.initState();
    _selectedButtons = List.generate(_buttons.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_buttons.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              onPressed: _selectedButtons[index]
                  ? null
                  : () {
                      setState(() {
                        _selectedButtons[index] = true;

                        widget.onTap('${_buttons[index]}, ');
                      });
                    },
              style: _selectedButtons[index]
                  ? context.button.text5Disabled
                  : context.button.text5,
              child: Text(_buttons[index]),
            ),
          );
        }),
      ),
    );
  }
}
