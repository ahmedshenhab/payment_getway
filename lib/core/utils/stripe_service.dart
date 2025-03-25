import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../api_keys.dart';
import '../di/di.dart';
import '../../module/check_out/model/checkout_request/checkkout_request_model.dart';
import '../../module/check_out/model/checkout_response/checkout_response_model.dart';

class StripeService {
  var dio = getIt<Dio>();
  Future<CheckoutResponseModel> creatPaymentIntent(
    CheckkoutRequestModel checkoutRequestmodel,
  ) async {
    final response = await dio.post(
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

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: ' al hamed llah',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(CheckkoutRequestModel checkoutRequestmodel) async {
    final response = await creatPaymentIntent(checkoutRequestmodel);

    await initPaymentSheet(paymentIntentClientSecret: response.clientSecret!);
    await displayPaymentSheet();
  }
}
