import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backdrop_section_list.g.dart';

@JsonSerializable()
class BackdropSectionList extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'backdropCount')
  final int? backdropCount;
  @JsonKey(name: 'type')
  final String? type;

  const BackdropSectionList({
    this.id,
    this.name,
    this.backdropCount,
    this.type,
  });

  static const fromJsonFactory = _$BackdropSectionListFromJson;

  Map<String, dynamic> toJson() => _$BackdropSectionListToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        backdropCount,
        name,
        type,
      ];
}
