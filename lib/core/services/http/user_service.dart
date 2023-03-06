import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/user_model/user_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserService {
  static UserService get to => Modular.get<UserService>();
  final httpService = HttpService.to;

  Future<UserModel?> getUser() async {
    final Response? response = await httpService.get(
      path: APIConst.user,
      token: HiveService.to.getLogin(),
    );
    if (response?.statusCode == 200) {
      final UserModel accountModel =
      UserModel.fromJson(response!.data["payload"]);
      return accountModel;
    }
    return null;
  }

}