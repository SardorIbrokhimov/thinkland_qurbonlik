import 'package:bot_toast/bot_toast.dart';
import 'package:cartouch/core/bloc/loader/loader_cubit.dart';
import 'package:cartouch/core/bloc/user_cubit/user_cubit.dart';
import 'package:cartouch/core/services/http/account_service.dart';
import 'package:cartouch/core/services/http/backdrop_service.dart';
import 'package:cartouch/core/services/http/car_service.dart';
import 'package:cartouch/core/services/http/credit_service.dart';
import 'package:cartouch/core/services/http/login_service.dart';
import 'package:cartouch/core/services/http/pending_vehicle_service.dart';
import 'package:cartouch/core/services/http/retouched_service.dart';
import 'package:cartouch/core/services/http/signup_service.dart';
import 'package:cartouch/core/services/http/upload_service.dart';
import 'package:cartouch/core/services/http/user_service.dart';
import 'package:cartouch/core/services/http/your_image_service.dart';

import 'package:cartouch/ui/view/intro_page/intro_page.dart';
import 'package:cartouch/ui/view/personal_data/personal_data.dart';
import 'package:cartouch/ui/view/phone_veritify/phone_veritify.dart';
import 'package:cartouch/ui/view/sign_up_page/sign_up_page.dart';
import 'package:cartouch/ui/widgets/dropdown/cubit/dropdown_cubit.dart';
import 'package:cartouch/ui/widgets/dropdown/dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/language/language_cubit.dart';
import 'core/services/hive_service.dart';
import 'core/services/http/http_service.dart';


class App extends StatelessWidget {
  const App({
    Key? key,
    // this.androidOverscrollIndicator = AndroidOverscrollIndicator.glow,
  }) : super(key: key);

  // final AndroidOverscrollIndicator androidOverscrollIndicator;

  @override
  Widget build(BuildContext context) {
    // Modular.setInitialRoute(CameraPage.routeName);
    Modular.setInitialRoute(PersonalDataPage.routename);
    Modular.setObservers([BotToastNavigatorObserver()]);
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: LanguageCubit.to,
      buildWhen: (previous, current) {
        Future.sync(() => context.setLocale(current));
        return true;
      },
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 817),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            title: "Qurbonlik",
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            builder: EasyLoading.init(
              builder: BotToastInit(),
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: ThemeData(
                // androidOverscrollIndicator: androidOverscrollIndicator,
                ),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<HttpService>((i) => HttpService.init()),
        Bind.singleton<LanguageCubit>(
          (i) => LanguageCubit(),
          onDispose: (v) => v.close(),
        ),
        AsyncBind<HiveService>((i) => HiveService.init()),
        // AsyncBind<DBService>((i) => DBService.init()),
        Bind.lazySingleton<LoginService>((i) => LoginService()),
        Bind.lazySingleton<AccountService>((i) => AccountService()),

        Bind.lazySingleton<CreditService>((i) => CreditService()),
        Bind.lazySingleton<UserService>((i) => UserService()),
        Bind.lazySingleton<CarService>((i) => CarService()),
        Bind.lazySingleton<YourImageService>((i) => YourImageService()),
        Bind.lazySingleton<PendingVehicleService>(
            (i) => PendingVehicleService()),
        Bind.lazySingleton<UploadService>((i) => UploadService()),
        Bind.lazySingleton<BackdropService>((i) => BackdropService()),
        Bind<SignupService>((i) => SignupService()),

        Bind<UserCubit>(
          (i) => UserCubit()..load(),
          onDispose: (value) => value.close(),
        ),
        Bind<DropdownCubit>(
          (i) => DropdownCubit(),
          onDispose: ((value) => (value) => value.close()),
        ),
        Bind<LoaderCubit>(
          (i) => LoaderCubit(),
          onDispose: (value) => value.close(),
        ),





      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: SignUpModule()),
        ModuleRoute("/", module: PhoneVeritifyModule()),
        ModuleRoute("/", module: IntroModule()),
        ModuleRoute("/", module: PersonalDataModule()),

        ModuleRoute("/", module: DropDownModule()),

      ];
}
