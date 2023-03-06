import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class Signup extends Equatable {
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'fullName')
  final bool? fullName;
  @JsonKey(name: 'companyName')
  final bool? companyName;

  const Signup({
    this.password,
    this.email,
    this.fullName,
    this.companyName,
  });

  static const fromJsonFactory = _$SignupFromJson;

  Map<String, dynamic> toJson() => _$SignupToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        password,
        email,
        fullName,
        companyName,
      ];
}
