import 'package:cartouch/core/services/hive_service.dart';

class APIConst {
  static const String apiURL = "https://api.cartouch.ai";
  static const String signup='/api/v1/auth/signup';
  static const String login='/api/v1/auth/login';
  static const String refreshToken='/api/v1/auth/token/refresh';
  static const String verify='/api/v1/auth/signup/verify-email';
  static const String account='/api/v1/user';
  static const String loginReset='/api/v1/auth/forgot-password';
  static const String backdropLibrary='/api/v1/backdrop/section/list';
  static const String backdropSettings='/api/v1/backdrop/settings/';
  static const String retouched='/api/v1/cars/list';
  static const String credit='/api/v1/credit/rate/list';
  static const String creditPost='/api/v1/credit/subscribe';
  static String getUserAccountCredit(int? id)=>'/api/v1/credit/rate/$id';
  static String getCarById(int id)=>'/api/v1/cars/$id';
  static String deleteCarById(int id)=>'/api/v1/cars/delete/$id';
  static const String creditCancel='/api/v1/credit/subscription/cancel';
  static const String updateCar='/api/v1/cars/update';
  static const String validate='http://45.129.170.69:5001/validate';
  static const String user='/api/v1/user';
  static const String yourImage='/api/v1/retouch';
  static const String imageDeleteList='/api/v1/cars/images/delete';
  static String retouchedDownloaded(int id)=>'https://api.cartouch.ai/api/v1/cars/download/${HiveService.to.getLogin()}/$id';
  static String resetLink='/api/v1/auth/signup/verify-email/resend/${HiveService.to.getLogin()}';
  static String imageDownloaded(int id)=>'https://api.cartouch.ai/api/v1/cars/images/download/${HiveService.to.getLogin()}/$id';
  static  String backdropBySection(int id)=>'/api/v1/backdrop/list?sectionId=$id';
  // static const String signup = '/api/v1/auth/signup';
  // static const String login = '/api/v1/auth/login';
  // static const String refreshToken = '/api/v1/auth/token/refresh';
  // static const String verify = '/api/v1/auth/signup/verify-email';
  // static const String account = '/api/v1/user';
  // static const String loginReset = '/api/v1/auth/forgot-password';
  // static const String backdropLibrary = '/api/v1/backdrop/section/list';
  // static const String backdropSettings = '/api/v1/backdrop/settings/';
  // static const String retouched = '/api/v1/cars/list';
  // static const String credit = '/api/v1/credit/rate/list';
  // static const String creditPost = '/api/v1/credit/subscribe';
  //
  // static String getUserAccountCredit(int? id) => '/api/v1/credit/rate/$id';
  //
  // static String getCarById(int id) => '/api/v1/cars/$id';
  //
  // static String deleteCarById(int id) => '/api/v1/cars/delete/$id';
  // static const String creditCancel = '/api/v1/credit/subscription/cancel';
  // static const String updateCar = '/api/v1/cars/update';
  // static const String validate = 'http://45.129.170.69:5001/validate';
  // static const String user = '/api/v1/user';
  // static const String yourImage = '/api/v1/retouch';
  // static const String imageDeleteList = '/api/v1/cars/images/delete';
  //
  // static String retouchedDownloaded(int id) =>
  //     'https://api.cartouch.ai/api/v1/cars/download/${HiveService.to.getLogin()}/$id';
  //
  // static String imageDownloaded(int id) =>
  //     'https://api.cartouch.ai/api/v1/cars/images/download/${HiveService.to.getLogin()}/$id';
  //
  // static String backdropBySection(int id) =>
  //     '/api/v1/backdrop/list?sectionId=$id';

  //api/v1/backdrop/section/list?type=EXTERIOR
  static String backdropLibrarys(String backdropType) =>
      '/api/v1/backdrop/section/list?type=$backdropType';

  // static const String backdropSetting = '/api/v1/backdrop/settings/';

  static const String fileUpload = '/api/v1/file/upload';

  static String retouchDownloaded(String tokens, int id) =>
      'https://api.cartouch.ai/api/v1/cars/download/$tokens/$id';

  static String backdropBySections(int id) =>
      '/api/v1/backdrop/list?sectionId=$id';

  static const String updateLogoType =
      '/api/v1/backdrop/settings/update/logo?type=ACTIVE_LOGO';

  static String updateLogoPosition(String logoPosition) =>
      '/api/v1/backdrop/settings/update/logo-position?logoPosition=$logoPosition';

  static String updateIncludeLogo(String logoType, bool hasLogo) =>
      '/api/v1/backdrop/settings/update/include-logo?type=$logoType&value=$hasLogo';

  static String updateBackdrop(String backdropType, int backdropId) =>
      '/api/v1/backdrop/settings/update/backdrop?backdropId=$backdropId&type=$backdropType';
}
