import 'package:dio/dio.dart';

import 'auth_exception.dart';
import 'dto/app_exception.dart';
import 'l10n/generated/l10n.dart';

String errorToString(Object? error) => errorToStringList(error).first;

Set<String> errorToStringList(Object? error) {
  switch (error) {
    case AppException(messages: final messages):
      if (messages.isNotEmpty) {
        return messages;
      }
      return {S.current.somethingWentWrong};

    case AuthException(errors: final Map errors):
      final output = errors.values.expand(
        (item) {
          if (item is Iterable) {
            return item.map((e) => e.toString()).toSet();
          } else {
            return {item.toString()};
          }
        },
      ).toSet();
      if (output.isEmpty) {
        return {S.current.somethingWentWrong};
      }
      return output;

    case final DioException error:
      final e = AppException.fromJson(error.response?.data);
      if (e.messages.isEmpty) return {S.current.somethingWentWrong};
      return e.messages.toSet();

    default:
      return {S.current.somethingWentWrong};
  }
}
