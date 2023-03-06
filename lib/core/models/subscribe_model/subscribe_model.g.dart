// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeModel _$SubscribeModelFromJson(Map<String, dynamic> json) =>
    SubscribeModel(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      creditsLeft: json['creditsLeft'] as int?,
      packageType: json['packageType'] as String?,
      rateId: json['rateId'] as int?,
    );

Map<String, dynamic> _$SubscribeModelToJson(SubscribeModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'creditsLeft': instance.creditsLeft,
      'packageType': instance.packageType,
      'rateId': instance.rateId,
    };
