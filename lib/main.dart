import 'package:audio/app.dart';
import 'package:audio/core/di/inject.dart';
import 'package:audio/localization/helper/bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';
import 'dart:developer';
import 'package:audio/core/observers/bloc_observer.dart';
import 'package:audio/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

part 'setup.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  setup(
    () => MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => getIt.call()..add(const LoadLanguage()),
        ),
      ],
      child: KeyboardVisibilityProvider(
        child: App(),
      ),
    ),
  );
}