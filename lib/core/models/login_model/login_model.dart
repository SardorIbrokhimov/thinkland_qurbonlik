import 'package:cartouch/core/models/authority_model/authority_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable{
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'credits')
  final int? credits;
  @JsonKey(name: 'verified')
  final bool? verified;
  @JsonKey(name: 'authorities')
  final List<AuthorityModel>? authorities;
  @JsonKey(name: 'userName')
  final String? userName;

  const LoginModel({
    this.token,
    this.refreshToken,
    this.email,
    this.fullName,
    this.companyName,
    this.credits,
    this.verified,
    this.authorities,
    this.userName,
  });
  static const fromJsonFactory = _$LoginModelFromJson;

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    token,
    refreshToken,
    email,
    fullName,
    companyName,
    credits,
    verified,
    authorities,
    userName,
  ];
}




