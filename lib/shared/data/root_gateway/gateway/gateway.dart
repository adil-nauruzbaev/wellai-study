import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'i_gateway.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class Gateway implements IGateway {
  Gateway({
    required String token,
    required this.uriGeneral,
    required ValueChanged<DioException> onAuthError,
  }) {
    general = Dio()
      ..options.baseUrl = uriGeneral.toString()
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..interceptors.addAll(
        [
          AuthInterceptor(token: token),
          ErrorInterceptor(onAuthError: onAuthError),
        ],
      );
  }

  @override
  late final Dio general;

  @override
  final Uri uriGeneral;

  @override
  String get photoBaseUrl => uriGeneral.origin;
}
