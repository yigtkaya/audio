import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
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
      emit(state.copyWith(selectedLanguage: english));
      return;
    }
    emit(state.copyWith(selectedLanguage: english));
  }
}
