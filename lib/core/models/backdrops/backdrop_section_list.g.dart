// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backdrop_section_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackdropSectionList _$BackdropSectionListFromJson(Map<String, dynamic> json) =>
    BackdropSectionList(
      id: json['id'] as int?,
      name: json['name'] as String?,
      backdropCount: json['backdropCount'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$BackdropSectionListToJson(
        BackdropSectionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdropCount': instance.backdropCount,
      'type': instance.type,
    };
