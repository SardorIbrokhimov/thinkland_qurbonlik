import 'package:cartouch/core/models/subscribe_model/subscribe_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable{
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'subscription')
  final SubscribeModel? subscription;


  const UserModel({
    this.id,
    this.fullName,
    this.email,
    this.companyName,
    this.subscription,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    id,
    fullName,
    email,
    companyName,
    subscription,
  ];
}