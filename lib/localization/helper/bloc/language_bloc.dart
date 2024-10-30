import 'dart:io';

import 'package:audio/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:audio/localization/app_localizations.dart';
import 'package:audio/localization/helper/languages/english.dart';
import 'package:audio/localization/helper/languages/turkish.dart';
import 'package:audio/localization/helper/models/language.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<LoadLanguage>(onLoadLanguage);
  }

  final supportedLanguages = [
    turkish,
    english,
  ];

  void onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  void onLoadLanguage(LoadLanguage event, Emitter<LanguageState> emit) async {
    final deviceLocale = Locale(Platform.localeName.substring(0, 2));

    if (deviceLocale == const Locale('tr')) {
      emit(state.copyWith(selectedLanguage: turkish));
      return;
    }
    emit(state.copyWith(selectedLanguage: english));
  }
}

/// get AppLocalizations instance with global nav key
AppLocalizations get tr {
  assert(appNavigatorKey.currentContext != null, 'Dont you dare to use me without a proper [context]!!!');
  return AppLocalizations.of(appNavigatorKey.currentContext!);
}

// 925ef0e3-d743-42f8-9828-7766ac1c5db6
// c3640344-7233-49b2-a4a3-b29a408f4b72
