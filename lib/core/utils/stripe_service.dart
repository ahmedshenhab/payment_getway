import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../api_keys.dart';
import '../../module/check_out/data/model/checkout_request/checkkout_request_model.dart';
import '../../module/check_out/data/model/checkout_response/checkout_response_model.dart';

class StripeService {
  StripeService({required Dio dio}) : _dio = dio;
  final Dio _dio;
  Future<CheckoutResponseModel> _creatPaymentIntent(
    CheckkoutRequestModel checkoutRequestmodel,
  ) async {
    final response = await _dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': ApiKeys.secretKey,
        },
      ),

      data: checkoutRequestmodel.toJson(),
    );
    return CheckoutResponseModel.fromJson(response.data);
  }

  Future _initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: ' al hamed llah',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future _displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(CheckkoutRequestModel checkoutRequestmodel) async {
    final response = await _creatPaymentIntent(checkoutRequestmodel);

    await _initPaymentSheet(paymentIntentClientSecret: response.clientSecret!);
    await _displayPaymentSheet();
  }
}
