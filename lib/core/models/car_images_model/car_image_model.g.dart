// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarImageModel _$CarImageModelFromJson(Map<String, dynamic> json) =>
    CarImageModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cuttingStyle:
          $enumDecodeNullable(_$CuttingStatusEnumMap, json['cuttingStyle']),
      attachmentId: json['attachmentId'] as int?,
      watermarkAttachmentId: json['watermarkAttachmentId'] as int?,
      carId: json['carId'] as int?,
      imageLink: json['imageLink'] as String?,
    );

Map<String, dynamic> _$CarImageModelToJson(CarImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cuttingStyle': _$CuttingStatusEnumMap[instance.cuttingStyle],
      'attachmentId': instance.attachmentId,
      'watermarkAttachmentId': instance.watermarkAttachmentId,
      'carId': instance.carId,
      'imageLink': instance.imageLink,
    };

const _$CuttingStatusEnumMap = {
  CuttingStatus.HALF_CUT: 'HALF_CUT',
  CuttingStatus.FULL_CUT: 'FULL_CUT',
  CuttingStatus.BLUR_CUT: 'BLUR_CUT',
  CuttingStatus.INTERIOR_WHITENING: 'INTERIOR_WHITENING',
  CuttingStatus.INTERIOR_BLUR: 'INTERIOR_BLUR',
};
