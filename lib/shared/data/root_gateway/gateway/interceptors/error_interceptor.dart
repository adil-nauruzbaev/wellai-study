import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor implements Interceptor {
  ErrorInterceptor({
    required this.onAuthError,
  });

  static const authErrorCodes = [401, 403];
  static const authPaths = [
    '/user/login/email',
    '/user/login/phone',
    '/user/logout',
    '/user/register/email',
    '/user/register/phone,',
    '/user/register/email-confirm',
    '/user/register/phone-confirm',
    '/user/recovery/email',
    '/user/recovery/phone',
    '/user/recovery/confirm',
  ];

  final ValueChanged<DioException> onAuthError;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final isAuthError = authErrorCodes.contains(
      error.response?.statusCode,
    );
    final isNotAuthRequest = !authPaths.contains(
      error.requestOptions.path,
    );
    if (isAuthError && isNotAuthRequest) {
      onAuthError(error);
    }
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('🏐 {response.data} : ${response.data}');
    handler.next(response);
  }
}
