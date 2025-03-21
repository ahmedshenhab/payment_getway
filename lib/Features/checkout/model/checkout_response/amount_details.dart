import 'package:json_annotation/json_annotation.dart';

import 'tip.dart';

part 'amount_details.g.dart';

@JsonSerializable()
class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return _$AmountDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AmountDetailsToJson(this);

  AmountDetails copyWith({Tip? tip}) {
    return AmountDetails(tip: tip ?? this.tip);
  }
}
