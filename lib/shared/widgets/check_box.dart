import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    required this.textSpans,
    this.onChange,
    super.key,
    this.checkColor = Colors.white,
    this.boxColor = const Color(0xFF209F85),
    this.inactiveBoxColor = Colors.grey,
    this.textPadding = const EdgeInsets.fromLTRB(2, 0, 8, 0),
  });

  final Color checkColor;
  final Color boxColor;
  final Color inactiveBoxColor;
  final List<TextSpan> textSpans;
  final EdgeInsetsGeometry textPadding;
  final Function(bool)? onChange;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isChecked = !_isChecked;
                  widget.onChange?.call(_isChecked);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _isChecked ? widget.boxColor : Colors.transparent,
                  border: Border.all(
                    color: _isChecked ? widget.boxColor : widget.inactiveBoxColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 24,
                height: 24,
                child: _isChecked ? Icon(Icons.check, size: 14, color: widget.checkColor) : null,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: widget.textSpans,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
