import 'package:flutter/material.dart';
import 'package:audio/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static TextStyle get _titleLarge => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _titleMedium => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _titleSmall => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodyLarge => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodyMedium => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle get _bodySmall => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: fontFamily,
      );

  static TextStyle kErrorStyle({Color? color}) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.4,
        fontFamily: fontFamily,
      );
}
