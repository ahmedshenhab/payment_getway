import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/module/check_out/cubit/check_out_state.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/payment_intent_request_model.dart';
import 'package:payment_app/module/check_out/data/repo/repo_implementation.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit({required RepoImplementation repo})
    : _repo = repo,
      super(CheckOutInitialState());

  final RepoImplementation _repo;

  static CheckOutCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    emit(CheckOutLoadingState());

    final result = await _repo.makePayment(paymentIntentRequestModel);

    result.fold(
      (failure) {
        emit(CheckOutErrorState(error: failure.message));
      },
      (r) {
        emit(CheckOutSuccessState());
      },
    );
  }
}
