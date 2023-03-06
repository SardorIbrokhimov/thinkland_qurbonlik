import 'package:cartouch/core/models/enums/cutting_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_model.g.dart';

@JsonSerializable()
class BuyModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'imageStatus')
  final String? imageStatus;
  @JsonKey(name: 'platform')
  final String? platform;
  @JsonKey(name: 'cuttingStyle')
  final CuttingStatus? cuttingStyle;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  @JsonKey(name: 'numberOfImages')
  final int? numberOfImages;


  const BuyModel({
    this.id,
    this.name,
    this.imageStatus,
    this.platform,
    this.cuttingStyle,
    this.createdDate,
    this.numberOfImages,
  });

  factory BuyModel.fromJson(Map<String, dynamic> json) {
    return _$BuyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BuyModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    imageStatus,
    platform,
    cuttingStyle,
    createdDate,
    numberOfImages,
  ];
}