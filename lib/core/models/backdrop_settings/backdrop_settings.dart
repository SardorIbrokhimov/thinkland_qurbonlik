import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backdrop_settings.g.dart';

@JsonSerializable()
class BackdropSettings extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'exteriorBackdropId')
  final int? exteriorBackdropId;
  @JsonKey(name: 'interiorBackdropId')
  final int? interiorBackdropId;
  @JsonKey(name: 'activeLogoId')
  final int? activeLogoId;
  @JsonKey(name: 'numberPlateLogoId')
  final int? numberPlateLogoId;
  @JsonKey(name: 'logoPosition')
  final String? logoPosition;
  @JsonKey(name: 'exteriorBackdropLink')
  final String? exteriorBackdropLink;
  @JsonKey(name: 'interiorBackdropLink')
  final String? interiorBackdropLink;
  @JsonKey(name: 'activeLogoLink')
  final String? activeLogoLink;
  @JsonKey(name: 'numberPlateLogoLink')
  final String? numberPlateLogoLink;
  @JsonKey(name: 'includeLogo')
  final bool? includeLogo;
  @JsonKey(name: 'includeNumberPlateLogo')
  final bool? includeNumberPlateLogo;

  const BackdropSettings({
    this.id,
    this.exteriorBackdropLink,
    this.interiorBackdropLink,
    this.activeLogoLink,
    this.numberPlateLogoLink,
    this.exteriorBackdropId,
    this.interiorBackdropId,
    this.activeLogoId,
    this.numberPlateLogoId,
    this.logoPosition,
    this.includeLogo,
    this.includeNumberPlateLogo,
  });

  static const fromJsonFactory = _$BackdropSettingsFromJson;

  Map<String, dynamic> toJson() => _$BackdropSettingsToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        exteriorBackdropLink,
        interiorBackdropLink,
        activeLogoLink,
        numberPlateLogoLink,
        exteriorBackdropId,
        interiorBackdropId,
        activeLogoId,
        numberPlateLogoId,
        logoPosition,
        includeLogo,
        includeNumberPlateLogo,
      ];
}
