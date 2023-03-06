// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      subscription: json['subscription'] == null
          ? null
          : SubscribeModel.fromJson(
              json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'companyName': instance.companyName,
      'subscription': instance.subscription,
    };
