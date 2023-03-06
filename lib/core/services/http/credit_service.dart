import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/credit_model/credit_model.dart';
import 'package:cartouch/core/models/subscribe_model/subscribe_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'http_service.dart';

class CreditService {
  static CreditService get to => Modular.get<CreditService>();
  final httpService = HttpService.to;

  Future<List<CreditModel>?> getCreditList() async {
    try {
      final List<CreditModel> creditList = [];
      final Response? response = await httpService.get(
        path: APIConst.credit,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          for (var e in response.data["payload"]) {
            creditList.add(CreditModel.fromJsonFactory(e));
          }
        }
      }
      return creditList;
    } catch (e) {
      return null;
    }
  }

  Future<SubscribeModel?> postSubscribe(
    int id,
  ) async {
    try {
      var response = await httpService.post(
          path: APIConst.creditPost,
          token: HiveService.to.getLogin(),
          parameters: {
            "rateId": id,
          });
      if (response != null) {
        if (response.statusCode == 200) {
          final SubscribeModel subscribeModel =
              SubscribeModel.fromJson(response.data["payload"]);
          return subscribeModel;
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

  Future<SubscribeModel?> cancelSubscribe() async {
    try {
      var response = await httpService.post(
        path: APIConst.creditCancel,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final SubscribeModel subscribeModel =
              SubscribeModel.fromJson(response.data["payload"]);
          return subscribeModel;
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

  Future<CreditModel?> getUserAccountRate(int? id) async {
    try {
      var response = await httpService.get(
        path: APIConst.getUserAccountCredit(id),
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final CreditModel creditModel =
              CreditModel.fromJsonFactory(response.data["payload"]);
          return creditModel;
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
