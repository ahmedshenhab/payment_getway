import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/module/check_out/data/repo/repo.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/payment_intent_request_model.dart';

class RepoImplementation extends Repo {
  final StripeService _stripeService;

  RepoImplementation({required StripeService stripeService})
    : _stripeService = stripeService;

  @override
  Future<Either<Failure, void>> makePayment(
    PaymentIntentRequestModel checkoutRequestmodel,
  ) async {
    try {
      await _stripeService.makePayment(checkoutRequestmodel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
