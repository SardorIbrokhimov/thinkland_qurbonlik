import 'package:cartouch/core/models/enums/cutting_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_image_model.g.dart';

@JsonSerializable()
class CarImageModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'cuttingStyle')
  final CuttingStatus? cuttingStyle;
  @JsonKey(name: 'attachmentId')
  final int? attachmentId;
  @JsonKey(name: 'watermarkAttachmentId')
  final int? watermarkAttachmentId;
  @JsonKey(name: 'carId')
  final int? carId;
  @JsonKey(name: 'imageLink')
  final String? imageLink;

  const CarImageModel({
    this.id,
    this.name,
    this.cuttingStyle,
    this.attachmentId,
    this.watermarkAttachmentId,
    this.carId,
    this.imageLink,
  });
  factory CarImageModel.fromJson(Map<String, dynamic> json) {
    return _$CarImageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CarImageModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    cuttingStyle,
    attachmentId,
    watermarkAttachmentId,
    carId,
    imageLink,
  ];
}
