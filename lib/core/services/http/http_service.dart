import 'dart:convert';
import 'dart:io';

import 'package:cartouch/core/models/login_model/login_model.dart';
import 'package:cartouch/core/services/hive_service.dart';
import 'package:cartouch/core/services/http/login_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/api_const.dart';
import '../../utils/app_logger_util.dart';

class HttpService {
  HttpService.init() {
    if (_dio == null) {
      _dio = Dio();
      (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  static HttpService get to => Modular.get<HttpService>();

  Dio? _dio;

  Future<Response?> post({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      if(e.response!=null){
        if (e.response!.statusCode == 401) {
          print("post ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          post(
            token: HiveService.to.getLogin(),
            path: path,
            data: data,
            parameters: parameters,
          );
          return e.response;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> postLogin({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.post(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> patch({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        response = await _dio!.patch(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.patch(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      if(e.response!=null){
        if (e.response!.statusCode == 401) {
          print("patch ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          patch(
            token: HiveService.to.getLogin(),
            path: path,
            data: data,
            parameters: parameters,
          );
          return e.response;
        }
      }
      return e.response;

    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> patchFile({
    String? path,
    String? token,
    FormData? formData,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,

  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $formData");
      if (token == null) {
        response = await _dio!.patch(
          APIConst.apiURL + path,
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.patch(
          APIConst.apiURL + path,
          data: formData,
          options: Options(
            headers: headers,
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      if(e.response!=null){
        if (e.response!.statusCode == 401) {
          print("patchFile ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          patchFile(
            token: HiveService.to.getLogin(),
            path: path,
            formData: formData,
            parameters: parameters,
          );
          return e.response;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> postFile({
    String? path,
    FormData? formData,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    try {
      // AppLoggerUtil.d("API: ${APIConst.apiURL + path!}");
      if (token != null) {
        return await _dio!.post(
          path!,
          // APIConst.apiURL + path!,
          data: formData,
          options: Options(
            headers: {
              "accept": "application/json",
              "Content-Type": "multipart/from-data",
              'Authorization': 'Bearer $token',
            },
          ),
        );
      } else {
        return await _dio!.post(
          path!,
          // APIConst.apiURL + path!,
          data: formData,
          options: Options(
            headers: headers,
          ),
        );
      }
    } on DioError catch (e) {
      if(e.response!=null){
        if (e.response!.statusCode == 401) {
          print("post file ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          postFile(
            token: HiveService.to.getLogin(),
            path: path,
            headers: headers,
            formData: formData,
          );
          return e.response;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      return null;
    }
  }

  Future<Response?> postFileRetouch({
    String? path,
    FormData? formData,
    Map<String, dynamic>? parameters,
    String? token,
  }) async {
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $formData");
      if (token != null) {
        return await _dio!.post(
            APIConst.apiURL + path,
            data: formData,
            options: Options(
              headers: {
                "accept": "application/json",
                "Content-Type": "multipart/from-data",
                'Authorization': 'Bearer $token',
              },
            ),
            queryParameters: parameters,
        );
      } else {
        return await _dio!.post(
            // path!,
            APIConst.apiURL + path,
            data: formData,
            options: Options(
              headers: {
                "accept": "application/json",
                "Content-Type": "multipart/from-data",
                'Authorization': 'Bearer $token',
              },
            ),
            // queryParameters: parameters,
        );
      }
    } on DioError catch (e) {
      if(e.response!=null){
        if (e.response!.statusCode == 401) {
          print("postRetouch file ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          postFileRetouch(
            token: HiveService.to.getLogin(),
            path: path,
            parameters: parameters,
            formData: formData,
          );
          return e.response;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      return null;
    }
  }

  Future<Response> delete({
    String? path,
    String? token,
    dynamic data,
    Map<String, dynamic>? parameters,
  }) async {
    late Response response;
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!}");
      if (token == null) {
        response = await _dio!.delete(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          queryParameters: parameters,
        );
        return response;
      } else {
        response = await _dio!.delete(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: parameters,
        );
        return response;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          print("delete ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          delete(
            token: HiveService.to.getLogin(),
            path: path,
            data: data,
            parameters: parameters,
          );
          return e.response!;
        }
      }
      return e.response!;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> put({
    String? path,
    String? token,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        return await _dio!.put(
          APIConst.apiURL + path,
          data: jsonEncode(data),
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );
      } else {
        return await _dio!.put(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          print("put ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          put(
            token: HiveService.to.getLogin(),
            path: path,
            data: data,
            headers: headers,
          );
          return e.response!;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> patchBox({
    String? path,
    String? token,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      AppLoggerUtil.d("API: ${APIConst.apiURL + path!} $data");
      if (token == null) {
        return await _dio!.patch(
          APIConst.apiURL + path,
          data: jsonEncode(data),
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );
      } else {
        return await _dio!.patch(
          APIConst.apiURL + path,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          print("patchBox ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          patchBox(
            token: HiveService.to.getLogin(),
            path: path,
            data: data,
            headers: headers,
          );
          return e.response!;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }

  Future<Response?> get({
    String? path,
    String? url,
    Map<String, dynamic>? parameters,
    String? token,
  }) async {
    try {
      if (url == null) {
        if (parameters == null) {
          if (token == null) {
            return await _dio!.get(APIConst.apiURL + path!);
          } else {
            return await _dio!.get(
              APIConst.apiURL + path!,
              options: Options(
                headers: {"Authorization": "Bearer $token"},
              ),
            );
          }
        }
        return await _dio!.get(
          APIConst.apiURL + path!,
          queryParameters: parameters,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      } else {
        if (parameters == null && token == null) {
          return await _dio!.get(url);
        }
        return await _dio!.get(
          url,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          print("get ishladi");
          LoginModel? loginModel = await LoginService.to.refreshToken();
          HiveService.to.setLogin(loginModel!.token!);
          get(
            token: HiveService.to.getLogin(),
            parameters: parameters,
            path: path,
          );
          return e.response!;
        }
      }
      return e.response;
    } catch (e) {
      AppLoggerUtil.e(e.toString());
      rethrow;
    }
  }
}
