import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit_model.g.dart';

@JsonSerializable()
class CreditModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'credit')
  final int? credit;
  @JsonKey(name: 'targetCompanies')
  final String? targetCompanies;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'dollarPerCredit')
  final double? dollarPerCredit;
  @JsonKey(name: 'active')
  final bool? active;

  const CreditModel({
    this.id,
    this.title,
    this.credit,
    this.targetCompanies,
    this.price,
    this.dollarPerCredit,
    this.active,
  });

  static const fromJsonFactory = _$CreditModelFromJson;

  Map<String, dynamic> toJson() => _$CreditModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        title,
        credit,
        targetCompanies,
        price,
        dollarPerCredit,
        active,
      ];
}
