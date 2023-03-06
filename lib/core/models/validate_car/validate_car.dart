import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_car.g.dart';

@JsonSerializable()
class ValidateCar extends Equatable {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'class')
  final String? msg;

  const ValidateCar({
    this.success,
    this.msg,
  });

  static const fromJsonFactory = _$ValidateCarFromJson;

  Map<String, dynamic> toJson() => _$ValidateCarToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, msg];


}

class ValidateCar1 {
  bool? success;
  String? msg;

  ValidateCar1({this.success, this.msg});

  ValidateCar1.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    return data;
  }
}
