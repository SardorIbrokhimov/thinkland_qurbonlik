import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  static LanguageCubit get to => Modular.get<LanguageCubit>();

  LanguageCubit() : super(const Locale('uz', 'UZ'));

  List<Locale> locales = [
    const Locale("ru", "RU"),
    const Locale("uz", "UZ"),
    const Locale("en", "EN"),
  ];
  List<String> localeName = [
    "Русский",
    "O’zbekcha",
    "English",
  ];

  Future setLocale(Locale locale) async {
    AppLoggerUtil.w("${locale.countryCode}");
    emit(locale);
  }

  bool isActive(Locale locale) {
    return state.countryCode == locale.countryCode;
  }

  String get title {
    switch (state.countryCode) {
      case "RU":
        return localeName[0];
      case "UZ":
        return localeName[1];
      case "EN":
        return localeName[2];
      default:
        return '';
    }
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return (json['app_locale'] as String).toLocale();
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'app_locale': "${state.languageCode}_${state.countryCode}"};
  }
}
