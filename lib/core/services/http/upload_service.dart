import 'dart:io';

import 'package:cartouch/core/constants/api_const.dart';
import 'package:cartouch/core/models/upload_response/file_upload_response.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';



class UploadService{
  static UploadService get to => Modular.get<UploadService>();


  Future<FileUploadResponse?> postFile({required PlatformFile file}) async {
    try {
      final headers = {
        HttpHeaders.contentTypeHeader: "application/json",
      };
      FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path!),
          "type": file.extension
      });
      final Response? response = await HttpService.to.postFile(
        headers: headers,
        path: APIConst.fileUpload,
        token: HiveService.to.getLogin(),
        formData: formData,
      );
      if (response == null) {
        return null;
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return FileUploadResponse.fromJsonFactory(response.data['payload']);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }


}