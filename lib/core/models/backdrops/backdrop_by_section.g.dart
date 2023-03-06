// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backdrop_by_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackdropBySection _$BackdropBySectionFromJson(Map<String, dynamic> json) =>
    BackdropBySection(
      id: json['id'] as int?,
      sectionId: json['sectionId'] as int?,
      link: json['link'] as String?,
      groundHeight: json['groundHeight'] as int?,
    );

Map<String, dynamic> _$BackdropBySectionToJson(BackdropBySection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sectionId': instance.sectionId,
      'link': instance.link,
      'groundHeight': instance.groundHeight,
    };
