import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppDesignConstants {
  /// Design constants
  static const designSize = Size(390, 844);

  static double borderRadiusCircular = 32.r;
  static double borderRadius = 16.r;
  static double borderRadiusSmall = 8.r;

  static double elevation = 4.h;

  static double iconSize = 24.r;

  static double horizontalPaddingLarge = 24.w;
  static double horizontalPaddingMedium = 16.w;
  static double horizontalPaddingSmall = 8.w;

  static double verticalPaddingLarge = 20.h;
  static double verticalPaddingMedium = 12.h;
  static double verticalPaddingSmall = 6.h;

  static double spacingLarge = 24;
  static double spacingMedium = 16;
  static double spacing = 8;

  static EdgeInsets paddingOfCustomHeader = EdgeInsets.fromLTRB(20.w, 85.h, 20.w, 5.h);
}
