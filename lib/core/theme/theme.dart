import 'package:flutter/material.dart';
import 'package:audio/core/constants/app_colors.dart';

@immutable
final class LightTheme {
  const LightTheme._();

  static const fontFamily = 'Inter';

  static final theme = ThemeData(
    primaryColor: AppColors.kPrimary,
    appBarTheme: AppBarTheme(
      color: AppColors.kWhite,
    ),
    scaffoldBackgroundColor: AppColors.kBackground,
    textTheme: TextTheme(
      titleLarge: _titleLarge,
      titleMedium: _titleMedium,
      titleSmall: _titleSmall,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
    ),
    fontFamily: fontFamily,
  );

  static TextStyle get _titleLarge => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _titleMedium => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _titleSmall => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle kErrorStyle({Color? color}) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
        fontFamily: fontFamily,
      );
}
