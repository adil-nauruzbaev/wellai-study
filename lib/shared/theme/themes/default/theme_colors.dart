import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../_interface/i_colors.dart';

class ThemeColors extends Equatable implements IColors {
  const ThemeColors({
    this.background = const Color(0xFFFFFFFF),
    this.backgroundGrey = const Color(0xFFF2F2F2),
    this.textPrimary = const Color(0xFF212429),
    this.error = const Color(0xFFE94335),
    this.errorBg = const Color(0xFFFDEBE7),
    this.success = const Color(0xFF49B66E),
    this.successBg = const Color(0xFFE8F7EB),
    this.grey900 = const Color(0xFF6B7280),
    this.grey700 = const Color(0xFFAFAFAF),
    this.grey300 = const Color(0xFFD8DADD),
    this.grey100 = const Color(0xFFF4F4F5),
    this.greyText = const Color(0xFF727F88),
    this.borderGrey = const Color(0xFFD9DCDE),
    this.grayscaleDarkGray = const Color(0xFF31363D),
    this.link = const Color(0xFF3E66CE),
    this.accent = const Color(0xFF209F85),
    this.accentDr = const Color(0xFF166F5D),
    this.shadow = const Color(0xff000000),
    this.shadow2 = const Color(0xff000000),
    this.accentBg = const Color.fromRGBO(255, 140, 28, 0.12),
    this.buttonGreen = const Color(0xFF209F85),
    this.notificationsCout = const Color(0xFFF7F4FB),
    this.outlineButton = const Color(0xFF8252CE),
    this.buttonBackground = const Color(0xFFEDF7F5),
    this.lightGrey = const Color(0xFF9A9EA7),
  });

  @override
  final Color borderGrey;
  @override
  final Color lightGrey;

  @override
  final Color notificationsCout;

  @override
  final Color buttonBackground;
  @override
  final Color outlineButton;
  @override
  final Color grayscaleDarkGray;

  @override
  final Color accentDr;

  @override
  final Color backgroundGrey;

  @override
  final Color greyText;

  @override
  final Color buttonGreen;

  @override
  final Color accent;

  @override
  final Color accentBg;

  @override
  final Color background;

  @override
  final Color error;

  @override
  final Color errorBg;

  @override
  final Color grey100;

  @override
  final Color grey300;

  @override
  final Color grey700;

  @override
  final Color grey900;

  @override
  final Color link;

  @override
  final Color shadow;

  @override
  final Color shadow2;

  @override
  final Color success;

  @override
  final Color successBg;

  @override
  final Color textPrimary;

  @override
  ThemeColors copyWith({
    Color? borderGrey,
    Color? buttonBackground,
    Color? outlineButton,
    Color? accentDr,
    Color? notificationsCout,
    Color? grayscaleDarkGray,
    Color? backgroundGrey,
    Color? greyText,
    Color? buttonGreen,
    Color? accent,
    Color? accentBg,
    Color? background,
    Color? shadow,
    Color? error,
    Color? errorBg,
    Color? grey100,
    Color? grey300,
    Color? grey700,
    Color? grey900,
    Color? link,
    Color? success,
    Color? successBg,
    Color? textPrimary,
  }) {
    return ThemeColors(
      borderGrey: borderGrey ?? this.borderGrey,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      outlineButton: outlineButton ?? this.outlineButton,
      notificationsCout: notificationsCout ?? this.notificationsCout,
      accentDr: accentDr ?? this.accentDr,
      grayscaleDarkGray: grayscaleDarkGray ?? this.grayscaleDarkGray,
      backgroundGrey: backgroundGrey ?? this.backgroundGrey,
      greyText: greyText ?? this.greyText,
      buttonGreen: buttonGreen ?? this.buttonGreen,
      accent: accent ?? this.accent,
      accentBg: accentBg ?? this.accentBg,
      background: background ?? this.background,
      shadow: shadow ?? this.shadow,
      error: error ?? this.error,
      errorBg: errorBg ?? this.errorBg,
      grey100: grey100 ?? this.grey100,
      grey300: grey300 ?? this.grey300,
      grey700: grey700 ?? this.grey700,
      grey900: grey900 ?? this.grey900,
      link: link ?? this.link,
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      textPrimary: textPrimary ?? this.textPrimary,
    );
  }

  @override
  IColors lerp(ThemeExtension<IColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      borderGrey: Color.lerp(borderGrey, other.borderGrey, t)!,
      buttonBackground:
          Color.lerp(buttonBackground, other.buttonBackground, t)!,
      outlineButton: Color.lerp(outlineButton, other.outlineButton, t)!,
      notificationsCout:
          Color.lerp(notificationsCout, other.notificationsCout, t)!,
      accentDr: Color.lerp(accentDr, other.accentDr, t)!,
      grayscaleDarkGray:
          Color.lerp(grayscaleDarkGray, other.grayscaleDarkGray, t)!,
      backgroundGrey: Color.lerp(backgroundGrey, other.backgroundGrey, t)!,
      greyText: Color.lerp(greyText, other.greyText, t)!,
      buttonGreen: Color.lerp(buttonGreen, other.buttonGreen, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      background: Color.lerp(background, other.background, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      link: Color.lerp(link, other.link, t)!,
      grey900: Color.lerp(grey900, other.grey900, t)!,
      grey700: Color.lerp(grey700, other.grey900, t)!,
      grey300: Color.lerp(grey300, other.grey900, t)!,
      grey100: Color.lerp(grey100, other.grey900, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentBg: Color.lerp(accentBg, other.accentBg, t)!,
      success: Color.lerp(success, other.success, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
    );
  }

  @override
  List<Object> get props {
    return [
      borderGrey,
      buttonBackground,
      outlineButton,
      notificationsCout,
      accentDr,
      grayscaleDarkGray,
      backgroundGrey,
      greyText,
      buttonGreen,
      accent,
      accentBg,
      background,
      shadow,
      error,
      errorBg,
      grey100,
      grey300,
      grey700,
      grey900,
      link,
      success,
      successBg,
      textPrimary,
    ];
  }

  @override
  Object get type => IColors;
}
