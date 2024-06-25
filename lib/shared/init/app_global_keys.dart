import 'package:flutter/material.dart';

abstract class AppGlobalKeys {
  static final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();
  static final rootNavigator = GlobalKey<NavigatorState>();
}
