// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retouched_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetouchedVehicleModel _$RetouchedVehicleModelFromJson(
        Map<String, dynamic> json) =>
    RetouchedVehicleModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageStatus:
          $enumDecodeNullable(_$ImageStatusEnumMap, json['imageStatus']),
      platformStatus: json['platform'] as String?,
      imageLink: json['imageLink'] as String?,
      cuttingStyle:
          $enumDecodeNullable(_$CuttingStatusEnumMap, json['cuttingStyle']),
      createdDate: json['createdDate'] as String?,
      numberOfImages: json['numberOfImages'] as int?,
    );

Map<String, dynamic> _$RetouchedVehicleModelToJson(
        RetouchedVehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageStatus': _$ImageStatusEnumMap[instance.imageStatus],
      'platform': instance.platformStatus,
      'imageLink': instance.imageLink,
      'cuttingStyle': _$CuttingStatusEnumMap[instance.cuttingStyle],
      'createdDate': instance.createdDate,
      'numberOfImages': instance.numberOfImages,
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
