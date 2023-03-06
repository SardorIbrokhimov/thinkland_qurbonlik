import 'package:cartouch/core/models/enums/cutting_status.dart';
import 'package:cartouch/core/models/enums/image_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'retouched_vehicle_model.g.dart';

@JsonSerializable()
class RetouchedVehicleModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'imageStatus')
  final ImageStatus? imageStatus;
  @JsonKey(name: 'platform')
  final String? platformStatus;
  @JsonKey(name: 'imageLink')
  final String? imageLink;
  @JsonKey(name: 'cuttingStyle')
  final CuttingStatus? cuttingStyle;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  @JsonKey(name: 'numberOfImages')
  final int? numberOfImages;

  const RetouchedVehicleModel({
    this.id,
    this.name,
    this.imageStatus,
    this.platformStatus,
    this.imageLink,
    this.cuttingStyle,
    this.createdDate,
    this.numberOfImages,
  });

  static const fromJsonFactory = _$RetouchedVehicleModelFromJson;

  Map<String, dynamic> toJson() => _$RetouchedVehicleModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        name,
        imageStatus,
        platformStatus,
        imageLink,
        cuttingStyle,
        createdDate,
        numberOfImages,
      ];
}
