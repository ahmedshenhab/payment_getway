// ignore_for_file: public_member_api_docs, sort_constructors_first

class CheckkoutRequestModel {
  String currency;
  String amount;
  CheckkoutRequestModel({required this.currency, required this.amount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'currency': currency, 'amount': amount};
  }
}
