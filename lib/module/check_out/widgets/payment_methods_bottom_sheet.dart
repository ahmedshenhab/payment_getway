import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/helpers/extentions.dart';
import 'package:payment_app/core/secure_storage/secure_storage.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/module/check_out/cubit/check_out_state.dart';
import 'package:payment_app/module/check_out/cubit/ckeck_out_cubit.dart';
import 'package:payment_app/module/check_out/data/model/checkout_request/payment_intent_request_model.dart';
import 'package:payment_app/module/check_out/widgets/payment_methods_list_view.dart';
import 'package:payment_app/module/check_out/widgets/thank_you_card.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          PaymentMethodsListView(),
          SizedBox(height: 32),

          SizedBox(height: 32),
          BlocConsumer<CheckOutCubit, CheckOutStates>(
            listener: (context, state) {
              switch (state) {
                case CheckOutSuccessState():
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return ThankYouCard();
                      },
                    ),
                  );
                case CheckOutErrorState(error: String error):
                  {
                    context.pop();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  }

                default:
                  break;
              }
            },
            buildWhen: (previous, current) => current is CheckOutLoadingState,

            builder:
                (context, state) => CustomButton(
                  isLoading: state is CheckOutLoadingState,

                  onTap: () async {
                    PaymentIntentRequestModel checkoutRequestmodel =
                        PaymentIntentRequestModel(
                          currency: 'USD',
                          userAmount: 10.5,
                          customerid: await SecureStorage.read('customer_id'),
                        );
                    BlocProvider.of<CheckOutCubit>(
                      context,
                    ).makePayment(checkoutRequestmodel);
                  },

                  text: 'Continue',
                ),
          ),
        ],
      ),
    );
  }
}
