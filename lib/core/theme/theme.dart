import 'package:flutter/material.dart';
import 'package:audio/core/constants/app_colors.dart';

class ThemeController {
  ThemeController() {
    _init();
  }

  static const fontFamily = 'Inter';

  /// Colors
  final Color _kPrimaryColor = const Color(0xFFE7F0DF);

  /// ThemeData
  late ThemeData _themeData;

  ThemeData get themeData => _themeData;

  /// ThemeMode
  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    // Add any additional logic if needed when theme mode changes
  }

  final _kAppBarTheme = const AppBarTheme(backgroundColor: AppColors.kBackground);

  void _init() {
    _themeData = ThemeData(
      primaryColor: _kPrimaryColor,
      appBarTheme: _kAppBarTheme,
      scaffoldBackgroundColor: AppColors.kBackground,
      textTheme: TextTheme(
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
      ),
      // ignore: deprecated_member_use
    );
    // Initialize other properties if needed
  }

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
