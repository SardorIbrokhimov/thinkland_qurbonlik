// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backdrop_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackdropSettings _$BackdropSettingsFromJson(Map<String, dynamic> json) =>
    BackdropSettings(
      id: json['id'] as int?,
      exteriorBackdropLink: json['exteriorBackdropLink'] as String?,
      interiorBackdropLink: json['interiorBackdropLink'] as String?,
      activeLogoLink: json['activeLogoLink'] as String?,
      numberPlateLogoLink: json['numberPlateLogoLink'] as String?,
      exteriorBackdropId: json['exteriorBackdropId'] as int?,
      interiorBackdropId: json['interiorBackdropId'] as int?,
      activeLogoId: json['activeLogoId'] as int?,
      numberPlateLogoId: json['numberPlateLogoId'] as int?,
      logoPosition: json['logoPosition'] as String?,
      includeLogo: json['includeLogo'] as bool?,
      includeNumberPlateLogo: json['includeNumberPlateLogo'] as bool?,
    );

Map<String, dynamic> _$BackdropSettingsToJson(BackdropSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exteriorBackdropId': instance.exteriorBackdropId,
      'interiorBackdropId': instance.interiorBackdropId,
      'activeLogoId': instance.activeLogoId,
      'numberPlateLogoId': instance.numberPlateLogoId,
      'logoPosition': instance.logoPosition,
      'exteriorBackdropLink': instance.exteriorBackdropLink,
      'interiorBackdropLink': instance.interiorBackdropLink,
      'activeLogoLink': instance.activeLogoLink,
      'numberPlateLogoLink': instance.numberPlateLogoLink,
      'includeLogo': instance.includeLogo,
      'includeNumberPlateLogo': instance.includeNumberPlateLogo,
    };
