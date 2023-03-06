// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      companyName: json['companyName'] as String?,
      credits: json['credits'] as int?,
      verified: json['verified'] as bool?,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => AuthorityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'fullName': instance.fullName,
      'companyName': instance.companyName,
      'credits': instance.credits,
      'verified': instance.verified,
      'authorities': instance.authorities,
      'userName': instance.userName,
    };
