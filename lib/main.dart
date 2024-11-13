import 'package:audio/app.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/features/auth/bloc/auth_bloc.dart';
import 'package:audio/features/shopping_cart/cubit/cart_cubit.dart';
import 'package:audio/localization/helper/local_bloc/language_bloc.dart';
import 'package:audio/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:developer';
import 'package:audio/core/observers/bloc_observer.dart';
import 'package:audio/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'features/init/setup.dart';
part 'features/init/initializer.dart';

void main() {
  setup(
    () => _Initializer(
      child: App(),
    ),
  );
}
