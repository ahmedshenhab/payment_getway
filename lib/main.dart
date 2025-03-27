import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/helpers/observer/bloc_observer.dart';
import 'package:payment_app/core/secure_storage/secure_storage.dart';
import 'package:payment_app/module/check_out/my_cart_view.dart';
import 'core/api_keys.dart';
import 'core/di/di.dart';
// ahmed shenhab

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  // craeteObserver;

  // await SecureStorage.write('name', 'ahmed shenhab');
  // final x =await  SecureStorage.read('customer_id');
  // log(x.toString());

  Bloc.observer = MyBlocObserver();

  Stripe.publishableKey = ApiKeys.publishKey;
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
