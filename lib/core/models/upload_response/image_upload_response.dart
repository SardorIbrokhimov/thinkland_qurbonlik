import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_upload_response.g.dart';

@JsonSerializable()
class ImageUploadResponse extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'filename')
  final String? filename;
  @JsonKey(name: 'link')
  final String? link;

  const ImageUploadResponse({
    this.id,
    this.name,
    this.filename,
    this.link,
  });

  static const fromJsonFactory = _$ImageUploadResponseFromJson;

  Map<String, dynamic> toJson() => _$ImageUploadResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        name,
        filename,
        link,
      ];
}
