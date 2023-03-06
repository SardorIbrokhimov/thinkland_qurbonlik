// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploadResponse _$ImageUploadResponseFromJson(Map<String, dynamic> json) =>
    ImageUploadResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      filename: json['filename'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ImageUploadResponseToJson(
        ImageUploadResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filename': instance.filename,
      'link': instance.link,
    };
