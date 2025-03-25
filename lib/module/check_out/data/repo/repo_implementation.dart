import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/checkkout_request_model.dart';
import 'package:payment_app/module/check_out/data/repo/repo.dart';

class RepoImplementation extends Repo {
  final StripeService stripeService;

  RepoImplementation({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment(
    CheckkoutRequestModel checkoutRequestmodel,
  ) async {
    try {
      await stripeService.makePayment(checkoutRequestmodel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
