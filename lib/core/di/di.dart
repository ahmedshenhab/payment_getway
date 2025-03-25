import 'dart:developer';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // getIt.registerLazySingleton<Dio>(() => DioHelper.instance);

  log('successfull setupGetIt');
}
