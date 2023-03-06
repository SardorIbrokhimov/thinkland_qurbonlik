// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditModel _$CreditModelFromJson(Map<String, dynamic> json) => CreditModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      credit: json['credit'] as int?,
      targetCompanies: json['targetCompanies'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      dollarPerCredit: (json['dollarPerCredit'] as num?)?.toDouble(),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$CreditModelToJson(CreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'credit': instance.credit,
      'targetCompanies': instance.targetCompanies,
      'price': instance.price,
      'dollarPerCredit': instance.dollarPerCredit,
      'active': instance.active,
    };
