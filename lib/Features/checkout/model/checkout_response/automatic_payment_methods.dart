import 'package:json_annotation/json_annotation.dart';

part 'automatic_payment_methods.g.dart';

@JsonSerializable()
class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return _$AutomaticPaymentMethodsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AutomaticPaymentMethodsToJson(this);

  AutomaticPaymentMethods copyWith({bool? enabled}) {
    return AutomaticPaymentMethods(enabled: enabled ?? this.enabled);
  }
}
