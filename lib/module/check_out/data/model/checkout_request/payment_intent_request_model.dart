class PaymentIntentRequestModel {
  String currency;
  int amount;
  
  String? customerid;
  PaymentIntentRequestModel({
    this.customerid,
    required this.currency,
    required double userAmount,
  }) : amount = (userAmount * 100).round();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'currency': currency,
      'amount': amount.toString(),
      'customer': customerid,
    };
  }
}
