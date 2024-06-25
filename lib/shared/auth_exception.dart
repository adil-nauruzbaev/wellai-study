import 'package:equatable/equatable.dart';

import 'l10n/generated/l10n.dart';

class AuthException extends Equatable implements Exception {
  const AuthException({
    this.errors,
    this.message,
  });

  final Map<String, dynamic>? errors;
  final String? message;

  @override
  List<Object?> get props => [message, errors];

  static AuthException fromMap(Map<String, dynamic> data) {
    String? message;
    Map<String, dynamic>? errors;

    if (data['errors'] is Map) {
      errors = data['errors'];
    } else if (data['errors'] is String) {
      message = data['errors'];
    }

    if (data['message'] is Map) {
      errors = data['message'];
    } else if (data['message'] is String) {
      message = data['message'];
    }

    return AuthException(
      errors: errors,
      message: message,
    );
  }

  List? get email => _getErrorsList(errors?['email']);

  List? get phone => _getErrorsList(errors?['phone']);

  List? get password => _getErrorsList(errors?['password']);

  List? get cPassword => _getErrorsList(errors?['password_confirmation']);

  List? get uid => _getErrorsList(errors?['uid']);

  List? get code => _getErrorsList(errors?['code']);

  List? get iin => _getErrorsList(errors?['iin']);

  bool get isNotEmpty {
    final isNotEmpty = errors?.values.any((item) => item.isNotEmpty);
    return isNotEmpty ?? false;
  }
}

List? _getErrorsList(dynamic data) {
  if (data == null) return null;
  if (data is List) return data;
  if (data is String) return [data];
  return [S.current.somethingWentWrong];
}
