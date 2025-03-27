// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InitPaymentSheetRequestModel {
  String? clientSecret;
  String? ephemeralKey;
  String? customerId;
  InitPaymentSheetRequestModel({
    this.clientSecret,
    this.ephemeralKey,
    this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientSecret': clientSecret,
      'ephemeralKey': ephemeralKey,
      'customerId': customerId,
    };
  }

  factory InitPaymentSheetRequestModel.fromMap(Map<String, dynamic> map) {
    return InitPaymentSheetRequestModel(
      clientSecret:
          map['clientSecret'] != null ? map['clientSecret'] as String : null,
      ephemeralKey:
          map['ephemeralKey'] != null ? map['ephemeralKey'] as String : null,
      customerId:
          map['customerId'] != null ? map['customerId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InitPaymentSheetRequestModel.fromJson(String source) =>
      InitPaymentSheetRequestModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
