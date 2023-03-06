import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscribe_model.g.dart';

@JsonSerializable()
class SubscribeModel extends Equatable {
  @JsonKey(name: 'startDate')
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;
  @JsonKey(name: 'creditsLeft')
  final int? creditsLeft;
  @JsonKey(name: 'packageType')
  final String? packageType;
  @JsonKey(name: 'rateId')
  final int? rateId;

  const SubscribeModel({
    this.startDate,
    this.endDate,
    this.creditsLeft,
    this.packageType,
    this.rateId,
  });

  factory SubscribeModel.fromJson(Map<String, dynamic> json) {
    return _$SubscribeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubscribeModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        startDate,
        endDate,
        creditsLeft,
        packageType,
        rateId,
      ];
}
