// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentResponseModel _$PaymentIntentResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentIntentResponseModel(
  clientSecret: json['client_secret'] as String?,

  amount: (json['amount'] as num?)?.toInt(),

  currency: json['currency'] as String?,
);

Map<String, dynamic> _$PaymentIntentResponseModelToJson(
  PaymentIntentResponseModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'client_secret': instance.clientSecret,
};
