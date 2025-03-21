import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  dynamic installments;
  @JsonKey(name: 'mandate_options')
  dynamic mandateOptions;
  dynamic network;
  @JsonKey(name: 'request_three_d_secure')
  String? requestThreeDSecure;

  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);

  Card copyWith({
    dynamic installments,
    dynamic mandateOptions,
    dynamic network,
    String? requestThreeDSecure,
  }) {
    return Card(
      installments: installments ?? this.installments,
      mandateOptions: mandateOptions ?? this.mandateOptions,
      network: network ?? this.network,
      requestThreeDSecure: requestThreeDSecure ?? this.requestThreeDSecure,
    );
  }
}
