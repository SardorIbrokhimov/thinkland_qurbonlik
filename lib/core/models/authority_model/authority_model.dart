import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authority_model.g.dart';

@JsonSerializable()
class AuthorityModel extends Equatable{
  @JsonKey(name: 'role')
  final String? role;

  const AuthorityModel({
    this.role,
  });
  factory AuthorityModel.fromJson(Map<String, dynamic> json) {
    return _$AuthorityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthorityModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [role];


}