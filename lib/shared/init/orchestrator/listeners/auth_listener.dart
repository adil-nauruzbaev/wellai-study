import 'package:flutter/material.dart';

class AuthListener extends StatefulWidget {
  const AuthListener({required this.child, super.key});

  final Widget child;

  @override
  State<AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<AuthListener> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
