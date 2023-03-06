import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backdrop_by_section.g.dart';

@JsonSerializable()
class BackdropBySection extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'sectionId')
  final int? sectionId;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'groundHeight')
  final int? groundHeight;

  const BackdropBySection({
    this.id,
    this.sectionId,
    this.link,
    this.groundHeight,
  });

  static const fromJsonFactory = _$BackdropBySectionFromJson;

  Map<String, dynamic> toJson() => _$BackdropBySectionToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        sectionId,
        link,
        groundHeight,
      ];
}
