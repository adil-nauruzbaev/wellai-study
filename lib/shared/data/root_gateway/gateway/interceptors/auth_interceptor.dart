import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor {
  AuthInterceptor({required this.token});

  final String token;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..contentType = 'application/json; charset=utf-8'
      ..headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    // final uri = options.uri;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
