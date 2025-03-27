import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/module/check_out/data/repo/repo_implementation.dart';
import 'package:payment_app/network/remote/dio_helper.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.instance);

  getIt.registerLazySingleton<StripeService>(
    () => StripeService(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<RepoImplementation>(
    () => RepoImplementation(stripeService: getIt<StripeService>()),
  );

  log('successfull setupGetIt');
}
