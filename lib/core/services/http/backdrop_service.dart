import 'dart:io';

import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/backdrop_settings/backdrop_settings.dart';
import 'package:cartouch/core/models/backdrops/backdrop_by_section.dart';
import 'package:cartouch/core/models/backdrops/backdrop_section_list.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:cartouch/core/utils/app_logger_util.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BackdropService {
  static BackdropService get to => Modular.get<BackdropService>();

  Future<List<BackdropSectionList>?> getBackdropSectionList(
      String backdropType) async {
    try {
      final List<BackdropSectionList> backdropSectionList = [];
      final Response? response = await HttpService.to.get(
        path: APIConst.backdropLibrarys(backdropType),
        token: HiveService.to.getLogin(),
        // parameters:body,
      );
      print(HiveService.to.getLogin());
      if (response != null) {
        if (response.statusCode == 200) {
          for (var e in response.data["payload"]) {
            backdropSectionList.add(BackdropSectionList.fromJsonFactory(e));
          }
        }
      }
      return backdropSectionList;
    } catch (e) {
      return null;
    }
  }

  Future<List<BackdropBySection>?> getBackdropBySection(int id) async {
    try {
      final List<BackdropBySection> backdropBySection = [];
      final Response? response = await HttpService.to.get(
        path: APIConst.backdropBySection(id),
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          for (var e in response.data["payload"]) {
            backdropBySection.add(BackdropBySection.fromJsonFactory(e));
          }
        }
      }
      return backdropBySection;
    } catch (e) {
      return null;
    }
  }


  Future postBackdropSettings({
    int? exteriorBackdropId,
    int? interiorBackdropId,
    int? activeLogoId,
    int? numberPlateLogoId,
    String? logoPosition,
    bool? includeLogo,
    bool? includeNumberPlateLogo,
  }) async {
    try {
      final body = {
        "exteriorBackdropId": exteriorBackdropId,
        "interiorBackdropId": interiorBackdropId,
        "activeLogoId": activeLogoId,
        "numberPlateLogoId": numberPlateLogoId,
        "logoPosition": logoPosition,
        "includeLogo": includeLogo,
        "includeNumberPlateLogo": includeNumberPlateLogo,
      };
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      final Response? response = await HttpService.to.post(
        path: APIConst.backdropSettings,
        data: body,
        parameters: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          final bool loginResponse = response.data["payload"];
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

  Future<BackdropSettings?> updateLogoBackdropSettings({
    required PlatformFile? file,
  }) async {
    try {
      var formData = FormData();
      formData.files.add(
        MapEntry(
          "logo",
          await MultipartFile.fromFile(file!.path!),
        ),
      );
      final headers = {
        HttpHeaders.contentTypeHeader: "multipart/form-data",
        "Authorization": "Bearer ${HiveService.to.getLogin()}"
      };
      Response? response = await HttpService.to.patchFile(
        path: APIConst.updateLogoType,
        formData: formData,
        headers: headers,
        token: HiveService.to.getLogin(),
      );

      if (response != null) {
        if (response.statusCode == 200) {
          AppLoggerUtil.w("${response.data}");
          return BackdropSettings.fromJsonFactory(response.data["payload"]);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future updateLogoPositionBackdropSettings({
    required String logoPosition,
  }) async {
    try {
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      final Response? response = await HttpService.to.patch(
        path: APIConst.updateLogoPosition(logoPosition),
        parameters: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          var updateLogoPositionResponse = response.data["payload"];

          return BackdropSettings.fromJsonFactory(updateLogoPositionResponse);
        } else {
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future updateIncludeLogoBackdropSettings({
    required String logoType,
    required bool hasLogo,
  }) async {
    try {
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      final Response? response = await HttpService.to.patch(
        path: APIConst.updateIncludeLogo(logoType, hasLogo),
        parameters: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          var updateIncludeLogoResponse = response.data["payload"];

          return BackdropSettings.fromJsonFactory(updateIncludeLogoResponse);
        } else {
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future updateBackdropSettings({
    required String? backdropType,
    required int? backdropId,
  }) async {
    try {
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      final Response? response = await HttpService.to.patch(
        path: APIConst.updateBackdrop(backdropType!, backdropId!),
        parameters: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return BackdropSettings.fromJsonFactory(response.data["payload"]);
        } else {
          return null;
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future getBackdropSettings() async {
    try {
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};
      final Response? response = await HttpService.to.get(
        path: APIConst.backdropSettings,
        parameters: headers,
        token: HiveService.to.getLogin(),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return BackdropSettings.fromJsonFactory(response.data["payload"]);
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
