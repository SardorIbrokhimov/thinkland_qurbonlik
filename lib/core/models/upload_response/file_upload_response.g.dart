// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) =>
    FileUploadResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      filename: json['filename'] as String?,
      url: json['url'] as String?,
      resizedImageUrl: json['resizedImageUrl'] as String?,
    );

Map<String, dynamic> _$FileUploadResponseToJson(FileUploadResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filename': instance.filename,
      'url': instance.url,
      'resizedImageUrl': instance.resizedImageUrl,
    };
