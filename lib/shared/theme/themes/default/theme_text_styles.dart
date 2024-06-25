import 'package:flutter/material.dart';

import '../_interface/i_colors.dart';
import '../_interface/i_text_styles.dart';

class ThemeTextStyles implements ITextStyles {
  ThemeTextStyles(this._colors);
  @override
  late final n40w600 = TextStyle(
    fontSize: 40,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final bg16w600 = TextStyle(
    fontSize: 16,
    color: _colors.background,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final sh16w600 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final bg14w500 = TextStyle(
    fontSize: 14,
    color: _colors.background,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
  @override
  late final sh14w500 = TextStyle(
    fontSize: 14,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
  @override
  late final n18w400 = TextStyle(
    fontSize: 18,
    color: _colors.background,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final m24w400 = TextStyle(
    fontSize: 24,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final m32w400 = TextStyle(
    fontSize: 32,
    color: _colors.background,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final m18w400 = TextStyle(
    fontSize: 18,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final g18w500 = TextStyle(
    fontSize: 18,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  @override
  late final ga14w600 = TextStyle(
    fontSize: 18,
    color: _colors.accent,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final gsh14w600 = TextStyle(
    fontSize: 14,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final g14w500 = TextStyle(
    fontSize: 14,
    color: _colors.greyText,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
  @override
  late final g14w400 = TextStyle(
    fontSize: 14,
    color: _colors.greyText,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w400,
  );
  @override
  late final ss14w400 = TextStyle(
    fontSize: 14,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w400,
  );
  @override
  late final g16w400 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sh128w400 = TextStyle(
    fontSize: 12,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );

  @override
  late final greyT12w400 = TextStyle(
    fontSize: 12,
    color: _colors.greyText,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );

  @override
  late final b12w400 = TextStyle(
    fontSize: 12,
    color: _colors.accent,
    fontFamily: ' Gilroy-Bold',
    fontWeight: FontWeight.w400,
  );

  @override
  late final aDr18w400 = TextStyle(
    fontSize: 18,
    color: _colors.accentDr,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final m16w400 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );

  @override
  late final error16w400 = TextStyle(
    fontSize: 16,
    color: _colors.error,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final error16w500 = TextStyle(
    fontSize: 16,
    color: _colors.error,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
  @override
  late final gs16w500 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  @override
  late final m14w400 = TextStyle(
    fontSize: 14,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final greyText14w400 = TextStyle(
    fontSize: 14,
    color: _colors.greyText,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final ac14w400 = TextStyle(
    fontSize: 14,
    color: _colors.accent,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final err14w400 = TextStyle(
    fontSize: 14,
    color: _colors.error,
    fontFamily: 'Gilroy-Medium',
    fontWeight: FontWeight.w400,
  );
  @override
  late final n16w400 = TextStyle(
    fontSize: 16,
    color: _colors.background,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final ga16w6000 = TextStyle(
    fontSize: 16,
    color: _colors.accent,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final gsAc16w400 = TextStyle(
    fontSize: 16,
    color: _colors.accent,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );

  @override
  late final ssb16w400 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sb14w400 = TextStyle(
    fontSize: 14,
    color: _colors.accent,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );

  @override
  late final sbGT14w400 = TextStyle(
    fontSize: 14,
    color: _colors.greyText,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sb10w400 = TextStyle(
    fontSize: 10,
    color: _colors.background,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sbo10w400 = TextStyle(
    fontSize: 10,
    color: _colors.outlineButton,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sbo16w600 = TextStyle(
    fontSize: 16,
    color: _colors.outlineButton,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final g10w600 = TextStyle(
    fontSize: 10,
    color: _colors.accent,
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );
  @override
  late final sh10w400 = TextStyle(
    fontSize: 10,
    color: _colors.shadow,
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
  );
  @override
  late final n14w400 = TextStyle(
    fontSize: 14,
    color: _colors.background,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final gDGn14w400 = TextStyle(
    fontSize: 14,
    color: _colors.grayscaleDarkGray,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final shadowGr14w400 = TextStyle(
    fontSize: 14,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final bn16w400 = TextStyle(
    fontSize: 16,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Regular',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.3333,
  );
  @override
  late final sn14w400 = TextStyle(
    fontSize: 14,
    color: _colors.greyText,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sn12w400 = TextStyle(
    fontSize: 12,
    color: _colors.greyText,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final sh12w400 = TextStyle(
    fontSize: 12,
    color: _colors.shadow,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final gText10w400 = TextStyle(
    fontSize: 10,
    color: _colors.greyText,
    fontFamily: 'Gilroy-Regular',
    fontWeight: FontWeight.w400,
  );
  @override
  late final b16w600 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w600,
  );

  @override
  late final TextStyle error = TextStyle(
    fontSize: 14,
    color: _colors.error,
    fontFamily: 'Inter',
  );

  @override
  late final h16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final h20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final h24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    fontFamily: 'Montserrat Alternates',
    fontWeight: FontWeight.w700,
  );

  @override
  late final s10w500 = TextStyle(
    fontSize: 10,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s12w400 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  @override
  late final s12w500 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
  @override
  late final s10w600 = TextStyle(
    fontSize: 10,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  @override
  late final s12w700 = TextStyle(
    fontSize: 12,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s14w400 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  @override
  late final s14w500 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s14w700 = TextStyle(
    fontSize: 14,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s16w400 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  @override
  late final s16w500 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  @override
  late final s16w600 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  @override
  late final s16w700 = TextStyle(
    fontSize: 16,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );
  @override
  late final s18w500 = TextStyle(
    fontSize: 18,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  @override
  late final s20w700 = TextStyle(
    fontSize: 20,
    color: _colors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  @override
  late final s24w700 = TextStyle(
    fontSize: 24,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  @override
  late final s36w400 = TextStyle(
    fontSize: 36,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  @override
  late final s40w600 = TextStyle(
    fontSize: 40,
    color: _colors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  late final IColors _colors;

  @override
  ITextStyles copyWith() {
    return this;
  }

  @override
  ITextStyles lerp(ThemeExtension<ITextStyles>? other, double t) {
    return this;
  }

  @override
  Object get type => ITextStyles;
}
