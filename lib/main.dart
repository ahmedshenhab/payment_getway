import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = stripePublishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

// Future<void> initPaymentSheet() async {
//   try {
//     // 1. create payment intent on the server
//     final data = await _createTestPaymentSheet();

//     // 2. initialize the payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(

//         // Main params
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//         paymentIntentClientSecret: data['paymentIntent'],
//         // Customer keys

//       )
//     );
//     setState(() {
//       _ready = true;
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text('Error: $e')));
//     rethrow;
//   }
// }
