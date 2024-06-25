import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/_interface/app_theme.dart';
import '../themes/default/core_default_theme.dart';

class ThemeRepo {
  final availableThemes = [
    CoreDefaultTheme(),
  ];

  ValueNotifier<AppTheme> theme = ValueNotifier<AppTheme>(CoreDefaultTheme());

  void apply(String? themeId) {
    final theme = _themeFromID(themeId);
    if (theme == null) return;
    this.theme.value = theme;
    SystemChrome.setSystemUIOverlayStyle(
      theme.data.appBarTheme.systemOverlayStyle!,
    );
  }

  AppTheme? _themeFromID(String? themeID) {
    if (themeID == null) return null;
    return availableThemes.firstWhereOrNull(
      (theme) => theme.id == themeID,
    );
  }
}
