import 'dart:io';
import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupService {
  static SignupService get to => Modular.get<SignupService>();
  final httpService = HttpService.to;

  Future signup({
    String? email,
    String? password,
    String? fullName,
    String? companyName,
  }) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "fullName": fullName,
        "companyName":companyName,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.post(
        path: APIConst.signup,
        data: body,
        parameters: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          String loginResponse = response.data["payload"];
          return loginResponse;
        } else {
          return null;
        }
      }
    } catch (e) {

      rethrow;
    }
    return null;
  }

  Future verifyEmail({
    String? email,
    String? code,

  }) async {
    try {
      final body = {
        "email": email,
        "code": code,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.post(
        path: APIConst.verify,
        data: body,
        parameters: headers,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final bool loginResponse = response.data["payload"];
          AppLoggerUtil.i("response.data[payload]: ${response.data["payload"]}");
          print("response.statusCode; ${response.statusCode}");

          return loginResponse;
        } else {
          return null;
        }
      }
    } catch (e) {

      rethrow;
    }
    return null;
  }
  Future resetLink() async {
    final Response? response = await httpService.get(
      path: APIConst.resetLink,
      // token: HiveService.to.getLogin(),
    );
    if (response?.statusCode == 200) {
       String accountModel = response!.data["payload"];
      return accountModel;
    }
    return null;
  }
}
