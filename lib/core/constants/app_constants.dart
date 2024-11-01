import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class AppConstants {
  const AppConstants._();

  static const String appName = 'Audio E-Commerce';

  static const String initFunctionName = 'setup';

  /// EMAIL REGEX
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; //r'^[^@]+@[^@]+\.[^@]+'
}
