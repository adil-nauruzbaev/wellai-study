import 'package:dio/dio.dart';

abstract class IGateway {
  Dio get general;

  Uri get uriGeneral;

  String get photoBaseUrl;
}
