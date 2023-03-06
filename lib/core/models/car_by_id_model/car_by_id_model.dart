import 'package:cartouch/core/models/car_images_model/car_image_model.dart';
import 'package:cartouch/core/models/enums/cutting_status.dart';
import 'package:cartouch/core/models/enums/image_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_by_id_model.g.dart';

@JsonSerializable()
class CarByIdModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'imageStatus')
  final ImageStatus? imageStatus;
  @JsonKey(name: 'platform')
  final String? platform;
  @JsonKey(name: 'cuttingStyle')
  final CuttingStatus? cuttingStyle;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  @JsonKey(name: 'numberOfImages')
  final int? numberOfImages;
  @JsonKey(name: 'exterior')
  final List<CarImageModel>? exterior;
  @JsonKey(name: 'interior')
  final List<CarImageModel>? interior;

  const CarByIdModel({
    this.id,
    this.name,
    this.imageStatus,
    this.platform,
    this.cuttingStyle,
    this.createdDate,
    this.numberOfImages,
    this.exterior,
    this.interior,
  });

  factory CarByIdModel.fromJson(Map<String, dynamic> json) {
    return _$CarByIdModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CarByIdModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    imageStatus,
    platform,
    cuttingStyle,
    createdDate,
    numberOfImages,
    exterior,
    interior,
  ];
}
