import 'package:dartz/dartz.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/payment_intent_request_model.dart';

abstract class Repo {
  Future<Either<Failure, void>> makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  );
}

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
