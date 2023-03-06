import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/retouched_vehicle_model/retouched_vehicle_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PendingVehicleService {
  static PendingVehicleService get to => Modular.get<PendingVehicleService>();
  final httpService = HttpService.to;

  Future<List<RetouchedVehicleModel>?> getPendingVehicleList() async {
    try {
      final List<RetouchedVehicleModel> retouchedList = [];
      final Response? response = await httpService.get(
          path: APIConst.retouched,
          token: HiveService.to.getLogin(),
          parameters: {
            "size": 50,
            "retouchStatus": [
              "PROCESSING", "PROCESSED"
            ]
          });
      if (response != null) {
        if (response.statusCode == 200) {
          for (var e in response.data["payload"]["content"]) {
            retouchedList.add(RetouchedVehicleModel.fromJsonFactory(e));
          }
        }
      }
      return retouchedList;
    } catch (e) {
      return null;
    }
  }

}