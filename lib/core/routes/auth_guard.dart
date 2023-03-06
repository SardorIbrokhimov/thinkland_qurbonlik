import 'dart:async';

import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/ui/view/enter_page/enter_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: EnterPage.routeName);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute<dynamic> route) async {
    return Modular.get<HiveService>().getIsLoggedIn();
  }

}
