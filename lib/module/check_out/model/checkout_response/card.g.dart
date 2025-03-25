// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
  installments: json['installments'],
  mandateOptions: json['mandate_options'],
  network: json['network'],
  requestThreeDSecure: json['request_three_d_secure'] as String?,
);

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
  'installments': instance.installments,
  'mandate_options': instance.mandateOptions,
  'network': instance.network,
  'request_three_d_secure': instance.requestThreeDSecure,
};
