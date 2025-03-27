import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/secure_storage/secure_storage.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/customer_object_request_model.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/init_payment_sheet_request_model.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/payment_intent_request_model.dart';
import 'package:payment_app/module/check_out/data/model/checkout_response/customer_object_response_model.dart';
import 'package:payment_app/module/check_out/data/model/checkout_response/ephemeral_response_model/ephemeral_response_model.dart';
import 'package:payment_app/module/check_out/data/model/checkout_response/payment_intent_response_model.dart';
import '../api_keys.dart';

class StripeService {
  StripeService({required Dio dio}) : _dio = dio;

  final Dio _dio;

  // Future<CustomerObjectResponseModel> createCostumerObject(
  //   CustomerObjectRequestModel customerObjectRequestModel,
  // ) async {
  //   final response = await _dio.post(
  //     'https://api.stripe.com/v1/customers',
  //     options: Options(
  //       headers: {
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'Authorization': ApiKeys.secretKey,
  //       },
  //     ),
  //     data: customerObjectRequestModel.toJson(),
  //   );
  //   final customerObjectResponseModel = CustomerObjectResponseModel.fromJson(
  //     response.data,
  //   );
  //   await SecureStorage.write('customer_id', customerObjectResponseModel.id!);
  //   return customerObjectResponseModel;
  // }

  Future<EphemeralResponseModel> _craeteEphemeralKey() async {
    final customerId = await SecureStorage.read('customer_id');
    final response = await _dio.post(
      'https://api.stripe.com/v1/ephemeral_keys',
      options: Options(
        headers: {
          'Stripe-Version': '2022-08-01',

          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': ApiKeys.secretKey,
        },
      ),
      data: {'customer': customerId},
    );
    return EphemeralResponseModel.fromJson(response.data);
  }

  Future<PaymentIntentResponseModel> _creatPaymentIntent(
    PaymentIntentRequestModel checkoutRequestmodel,
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
    return PaymentIntentResponseModel.fromJson(response.data);
  }

  Future<void> _initPaymentSheet(
    InitPaymentSheetRequestModel initPaymentSheetRequestModel,
  ) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Fat_hallah',
        paymentIntentClientSecret: initPaymentSheetRequestModel.clientSecret,
        customerId: initPaymentSheetRequestModel.customerId,
        customerEphemeralKeySecret: initPaymentSheetRequestModel.ephemeralKey,
      ),
    );
  }

  Future<void> _displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    final EphemeralResponseModel responseEphemeralKey =
        await _craeteEphemeralKey();

    final responsePaymentIntent = await _creatPaymentIntent(
      paymentIntentRequestModel,
    );

    InitPaymentSheetRequestModel initPaymentSheetRequestModel =
        InitPaymentSheetRequestModel(
          clientSecret: responsePaymentIntent.clientSecret!,
          customerId:await SecureStorage.read('customer_id'),
          ephemeralKey: responseEphemeralKey.secret!,
        );

    await _initPaymentSheet(initPaymentSheetRequestModel);
    await _displayPaymentSheet();
  }
}
