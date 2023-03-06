// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarByIdModel _$CarByIdModelFromJson(Map<String, dynamic> json) => CarByIdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageStatus:
          $enumDecodeNullable(_$ImageStatusEnumMap, json['imageStatus']),
      platform: json['platform'] as String?,
      cuttingStyle:
          $enumDecodeNullable(_$CuttingStatusEnumMap, json['cuttingStyle']),
      createdDate: json['createdDate'] as String?,
      numberOfImages: json['numberOfImages'] as int?,
      exterior: (json['exterior'] as List<dynamic>?)
          ?.map((e) => CarImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      interior: (json['interior'] as List<dynamic>?)
          ?.map((e) => CarImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarByIdModelToJson(CarByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageStatus': _$ImageStatusEnumMap[instance.imageStatus],
      'platform': instance.platform,
      'cuttingStyle': _$CuttingStatusEnumMap[instance.cuttingStyle],
      'createdDate': instance.createdDate,
      'numberOfImages': instance.numberOfImages,
      'exterior': instance.exterior,
      'interior': instance.interior,
    };

const _$ImageStatusEnumMap = {
  ImageStatus.PROCESSING: 'PROCESSING',
  ImageStatus.PROCESSED: 'PROCESSED',
  ImageStatus.BOUGHT: 'BOUGHT',
};

const _$CuttingStatusEnumMap = {
  CuttingStatus.HALF_CUT: 'HALF_CUT',
  CuttingStatus.FULL_CUT: 'FULL_CUT',
  CuttingStatus.BLUR_CUT: 'BLUR_CUT',
  CuttingStatus.INTERIOR_WHITENING: 'INTERIOR_WHITENING',
  CuttingStatus.INTERIOR_BLUR: 'INTERIOR_BLUR',
};
