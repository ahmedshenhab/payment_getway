// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountDetails _$AmountDetailsFromJson(Map<String, dynamic> json) =>
    AmountDetails(
      tip:
          json['tip'] == null
              ? null
              : Tip.fromJson(json['tip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountDetailsToJson(AmountDetails instance) =>
    <String, dynamic>{'tip': instance.tip};
