import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_upload_response.g.dart';

@JsonSerializable()
class FileUploadResponse extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'filename')
  final String? filename;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'resizedImageUrl')
  final String? resizedImageUrl;

  const FileUploadResponse({
    this.id,
    this.name,
    this.filename,
    this.url,
    this.resizedImageUrl,
  });

  static const fromJsonFactory = _$FileUploadResponseFromJson;

  Map<String, dynamic> toJson() => _$FileUploadResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        name,
        filename,
        url,
        resizedImageUrl,
      ];
}
