import 'dart:convert';
import 'dart:ui';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../localization/locale_keys.g.dart';

class HiveService {
  static HiveService get to => Modular.get<HiveService>();

  late Box _box;

  static Future<HiveService> init() async {
    var instance = HiveService();

    instance._box = await Hive.openBox(LocaleKeys.app_name);

    return instance;
  }

  Future delete() async {
    await Hive.deleteFromDisk();
  }

  String getLang() {
    return _box.get(_HiveKeys.lang, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.lang, locale.toString());
  }
  // LoginModel? getLogin() {
  //   var loginModel = _box.get(_HiveKeys.loginModel, defaultValue: "");
  //   if (loginModel != null) {
  //     return LoginModel.fromJsonFactory(json.decode(loginModel));
  //   }
  //   return loginModel;
  // }
  //
  // void setLogin(LoginModel loginModel) {
  //   _box.put(_HiveKeys.loginModel, json.encode(loginModel.toJson()));
  // }
  //
  // Future deleteLogin()async{
  //   await _box.delete(_HiveKeys.loginModel);
  // }
  String getRefreshToken() {
    return _box.get(_HiveKeys.refreshToken, defaultValue: '');
  }

  String getExteriorImage() {
    return _box.get(_HiveKeys.exteriorImage, defaultValue: '');
  }
  void setExteriorImage(String exteriorImageLink){
    _box.put(_HiveKeys.exteriorImage, exteriorImageLink);
  }
  Future deleteExteriorImage()async{
    await _box.delete(_HiveKeys.exteriorImage);
  }

  String getLogoImage() {
    return _box.get(_HiveKeys.logoImage, defaultValue: '');
  }
  void setLogoImage(String logoImageLink){
    _box.put(_HiveKeys.logoImage, logoImageLink);
  }
  Future deleteLogoImage()async{
    await _box.delete(_HiveKeys.logoImage);
  }

  bool getLogoSwitch() {
    return _box.get(_HiveKeys.logoSwitch, defaultValue: false);
  }
  void setLogoSwitch(bool hasLogo){
    _box.put(_HiveKeys.logoSwitch, hasLogo);
  }

  void setRefreshToken(String refreshToken) {
    _box.put(_HiveKeys.refreshToken, refreshToken);
  }

  String getLogin() {
   return _box.get(_HiveKeys.token, defaultValue: '');
  }

  void setLogin(String token) {
    _box.put(_HiveKeys.token, token);
  }

  Future deleteLogin()async{
    await _box.delete(_HiveKeys.token);
  }

  bool getIsLoggedIn() {
    return _box.get(_HiveKeys.isLoggedIn, defaultValue: false);
  }

  void setIsLoggedIn(bool value) {
    _box.put(_HiveKeys.isLoggedIn, value);
  }

  void saveId(Map<String, dynamic> value){
    var text = value;
    print("\x1B[33m${text.toString()}\x1B[0m");
    _box.put(_HiveKeys.isId, jsonEncode(value));
  }

  Map<String, dynamic> getId(){
    var boxes=_box.get(_HiveKeys.isId);
    if(boxes==null){
      return {};
    }
    return (jsonDecode(boxes.toString())) as Map<String, dynamic>;
  }
  Future deleteId()async{
    await _box.delete(_HiveKeys.isId);
  }
  int? getAccountUserDate() {
    return _box.get(_HiveKeys.userAccount, defaultValue: 0);
  }

  void setAccountUserDate(int userId) {
    _box.put(_HiveKeys.userAccount, userId);
  }
  Future deleteAccountUserDate()async{
    await _box.delete(_HiveKeys.userAccount);
  }


}

class _HiveKeys {
  static const String lang = "lang";
  static const String refreshToken = "refreshToken";
  static const String isLoggedIn = "isLoggedIn";
  static const String token = "token";
  static const String isId = "isId";
  static const String userAccount = "userAccount";
  static const String exteriorImage = "exteriorImage";
  static const String logoImage = "logoImage";
  static const String logoSwitch = "logoSwitch";
}
