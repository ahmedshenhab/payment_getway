import 'package:json_annotation/json_annotation.dart';

import 'card.dart';
import 'link.dart';

part 'payment_method_options.g.dart';

@JsonSerializable()
class PaymentMethodOptions {
  Card? card;
  Link? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return _$PaymentMethodOptionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentMethodOptionsToJson(this);

  PaymentMethodOptions copyWith({Card? card, Link? link}) {
    return PaymentMethodOptions(
      card: card ?? this.card,
      link: link ?? this.link,
    );
  }
}
