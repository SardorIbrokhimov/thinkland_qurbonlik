import 'dart:async';
import 'dart:developer';

import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // AppLoggerUtil.d('onChange(${bloc.runtimeType},$change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLoggerUtil.d('onChange(${bloc.runtimeType},$error, $stackTrace)');
  }
}

Future<void> main() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  SharedPreferences.setMockInitialValues({});

  WidgetsFlutterBinding.ensureInitialized();
  // final androidInfo = await DeviceInfoPlugin().androidInfo;
  // final sdkVersion = androidInfo.version.sdkInt;
  // final androidOverscrollIndicator = sdkVersion > 30
  //     ? AndroidOverscrollIndicator.stretch
  //     : AndroidOverscrollIndicator.glow;

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  await runZonedGuarded(
    () async {
      await HydratedBlocOverrides.runZoned(
        () async => runApp(
          EasyLocalization(
            path: "assets/langs",
            supportedLocales: const [
              Locale("uz", "UZ"),
              Locale("ru", "RU"),
              Locale("en", "EN"),
            ],
            fallbackLocale: const Locale("en", "EN"),
            child: ModularApp(
              module: AppModule(),
              child: const App(
                  // androidOverscrollIndicator: androidOverscrollIndicator,
                  ),
            ),
          ),
        ),
        blocObserver: AppBlocObserver(),
        storage: storage,
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
