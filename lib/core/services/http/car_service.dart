import 'dart:io';

import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/car_by_id_model/car_by_id_model.dart';
import 'package:cartouch/core/models/validate_car/validate_car.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarService {
  static CarService get to => Modular.get<CarService>();
  final httpService = HttpService.to;

  Future<CarByIdModel?> getCarById(int id) async {
    try {
      Response? response = await httpService.get(
        path: APIConst.getCarById(id),
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          CarByIdModel carByIdModel =
              CarByIdModel.fromJson(response.data["payload"]);
          return carByIdModel;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<dynamic> downloadList(int id) async {
    try {
      Response? response = await httpService.get(
        path: APIConst.imageDownloaded(id),
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return response;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<dynamic> bayCarById(int id) async {
    try {
      Response? response = await httpService.patchBox(
        path: APIConst.getCarById(id),
        token: HiveService.to.getLogin(),
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> deleteCarById(int id) async {
    try {
      Response? response = await httpService.delete(
        path: APIConst.deleteCarById(id),
        token: HiveService.to.getLogin(),
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> updateCar(
    int? id,
    String? name,
  ) async {
    try {
      var body = {
        'id': id,
        'name': name,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      var response = await httpService.put(
        path: APIConst.updateCar,
        data: body,
        headers: headers,
        token: HiveService.to.getLogin(),
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> deleteList(List<int> id) async {
    try {
      Response? response = await httpService.delete(
          path: APIConst.imageDeleteList,
          token: HiveService.to.getLogin(),
          data: {'deletedImages': id});
      return response;
    } catch (e) {
      return null;
    }
  }

  Future validate({
    required File? file,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file!.path),
      });
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      Response? response = await HttpService.to.postFile(
        path: APIConst.validate,
        formData: formData,
        headers: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          AppLoggerUtil.i("${response.data}");
          return ValidateCar.fromJsonFactory(response.data);
        } else {
          return ValidateCar1.fromJson(response.data);
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
