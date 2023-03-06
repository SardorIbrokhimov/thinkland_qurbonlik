import 'dart:io';
import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/login_model/login_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginService {
  static LoginService get to => Modular.get<LoginService>();
  final httpService = HttpService.to;

  Future<LoginModel?> login(
    String email,
    String password,
  ) async {
    try {
      final data = {
        "email": email,
        "password": password,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.postLogin(
        path: APIConst.login,
        data: data,
        parameters: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final LoginModel loginModel =
              LoginModel.fromJsonFactory(response.data["payload"]);
          return loginModel;
        }
        if (response.statusCode == 404) {
          final code = response.data["errors"][0]['code'];
          if (code == 'USER_NOT_FOUND') {
            return const LoginModel();
          }
        }
      }
      return null;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      return null;
    }
  }

  Future<LoginModel?> refreshToken() async {
    try {
      final data = {
        "refreshToken": HiveService.to.getRefreshToken(),
      };
      // final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.post(
        path: APIConst.refreshToken,
        parameters: data,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final LoginModel loginModel =
              LoginModel.fromJsonFactory(response.data["payload"]);
          return loginModel;
        } else {
          return null;
        }
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
    return null;
  }

  Future loginReset({
    String? resetEmail,
  }) async {
    try {
      final data = {
        "email": resetEmail,
      };
      var response = await httpService.post(
        path: APIConst.loginReset,
        parameters: data,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final bool loginResponse = response.data["payload"];
          AppLoggerUtil.i(
              "response.data[payload]: ${response.data["payload"]}");
          print("response.statusCode; ${response.statusCode}");
          return loginResponse;
        } else {
          return null;
        }
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
    return null;
  }
}
