import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/template_car/template_car_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class YourImageService {
  static YourImageService get to => Modular.get<YourImageService>();
  final httpService = HttpService.to;

  Future retouchPost({
    String? name,
    String? exteriorStyle,
    String? interiorStyle,
    String? outputSize,
    List<TemplateCarModel> exteriorImages = const [],
    List<TemplateCarModel> interiorImages = const [],
  }) async {
    try {
      final parameters = {
        "name": name,
        "exteriorStyle": exteriorStyle,
        "interiorStyle": interiorStyle,
        "platform": "MOBILE",
        "outputSize": outputSize,
      };
      var formData = FormData();
      for (var file in exteriorImages) {
        formData.files.addAll([
          MapEntry(
              "exterior", await MultipartFile.fromFile(file.tempCarImg!.path)),
        ]);
      }
      for (var file in interiorImages) {
        formData.files.addAll([
          MapEntry(
              "interior", await MultipartFile.fromFile(file.tempCarImg!.path)),
        ]);
      }

      var response = await httpService.postFileRetouch(
        token: HiveService.to.getLogin(),
        path: APIConst.yourImage,
        parameters: parameters,
        formData: formData,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final bool loginResponse = response.data;
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
}
