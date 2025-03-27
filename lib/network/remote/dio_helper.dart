import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? _dio;

  DioHelper._();

  static Dio get instance {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
          baseUrl: '',
        ),
      );

      _dio!.interceptors.add(PrettyDioLogger());

      log('✅ Dio initialized & interceptor added!');
    }

    return _dio!;
  }
}

// here the instance intialized befor the start that mean no need to inject it

// class DioHelper {
//   static final DioHelper _instance = DioHelper._internal();
//   late final Dio dio;

//   factory DioHelper() {
//     return _instance;
//   }

//   DioHelper._internal() {
//     dio = Dio(
//       BaseOptions(
//         receiveDataWhenStatusError: true,
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         headers: {
//           'Accept': 'application/json',
//         },
//       ),
//     );

//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: true,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//       ),
//     );

//     log('Dio initialized successfully');
//   }

//   static Dio get instance => _instance.dio;
// }
