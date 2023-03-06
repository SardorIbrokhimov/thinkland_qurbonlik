// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Signup _$SignupFromJson(Map<String, dynamic> json) => Signup(
      password: json['password'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as bool?,
      companyName: json['companyName'] as bool?,
    );

Map<String, dynamic> _$SignupToJson(Signup instance) => <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'fullName': instance.fullName,
      'companyName': instance.companyName,
    };
