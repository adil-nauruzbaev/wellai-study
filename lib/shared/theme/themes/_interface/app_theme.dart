import 'package:flutter/material.dart';

import 'i_button_styles.dart';
import 'i_colors.dart';
import 'i_text_styles.dart';

abstract class AppTheme {
  abstract final ThemeData data;
  abstract final String id;
  abstract final String name;
}

extension AppThemeUtils on BuildContext {
  IColors get color => Theme.of(this).extension<IColors>()!;
  ITextStyles get text => Theme.of(this).extension<ITextStyles>()!;
  IButtonStyles get button => Theme.of(this).extension<IButtonStyles>()!;
  ThemeData get theme => Theme.of(this);
}

extension AppThemeDataUtils on ThemeData {
  IColors get color => extension<IColors>()!;
  ITextStyles get text => extension<ITextStyles>()!;
  IButtonStyles get button => extension<IButtonStyles>()!;
}
