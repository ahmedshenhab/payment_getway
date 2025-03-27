import 'package:json_annotation/json_annotation.dart';

part 'checkout_response_model.g.dart';

@JsonSerializable()
class PaymentIntentResponseModel {
  int? amount;

  String? currency;
  @JsonKey(name: 'client_secret')
  String? clientSecret;

  PaymentIntentResponseModel({this.amount, this.currency, this.clientSecret});

  factory PaymentIntentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PaymentIntentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentIntentResponseModelToJson(this);
}
