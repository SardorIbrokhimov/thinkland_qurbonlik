// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyModel _$BuyModelFromJson(Map<String, dynamic> json) => BuyModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageStatus: json['imageStatus'] as String?,
      platform: json['platform'] as String?,
      cuttingStyle:
          $enumDecodeNullable(_$CuttingStatusEnumMap, json['cuttingStyle']),
      createdDate: json['createdDate'] as String?,
      numberOfImages: json['numberOfImages'] as int?,
    );

Map<String, dynamic> _$BuyModelToJson(BuyModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageStatus': instance.imageStatus,
      'platform': instance.platform,
      'cuttingStyle': _$CuttingStatusEnumMap[instance.cuttingStyle],
      'createdDate': instance.createdDate,
      'numberOfImages': instance.numberOfImages,
    };

const _$CuttingStatusEnumMap = {
  CuttingStatus.HALF_CUT: 'HALF_CUT',
  CuttingStatus.FULL_CUT: 'FULL_CUT',
  CuttingStatus.BLUR_CUT: 'BLUR_CUT',
  CuttingStatus.INTERIOR_WHITENING: 'INTERIOR_WHITENING',
  CuttingStatus.INTERIOR_BLUR: 'INTERIOR_BLUR',
};
