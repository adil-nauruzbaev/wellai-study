import 'package:flutter/material.dart';

class CoreSettingsListener extends StatefulWidget {
  const CoreSettingsListener({required this.child, super.key});

  final Widget child;

  @override
  State<CoreSettingsListener> createState() => _CoreSettingsListenerState();
}

class _CoreSettingsListenerState extends State<CoreSettingsListener> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
