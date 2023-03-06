import 'dart:io';

import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/login_model/login_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AccountService {
  static AccountService get to => Modular.get<AccountService>();
  final httpService = HttpService.to;

  Future<LoginModel?> getAccount() async {
    final Response? response = await httpService.get(
      path: APIConst.account,
      token: HiveService.to.getLogin(),
    );
    if (response?.statusCode == 200) {
      final LoginModel accountModel =
          LoginModel.fromJsonFactory(response!.data["payload"]);
      return accountModel;
    }
    return null;
  }

  Future<dynamic> updateProfile(
    String? name,
    String? company,
  ) async {
    try {
      var body = {
        'fullName': name,
        'companyName': company,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.put(
        path: APIConst.account,
        data: body,
        headers: headers,
        token: HiveService.to.getLogin(),
      );
      return response;
    } catch (e) {
      return null;
    }
  }
}
