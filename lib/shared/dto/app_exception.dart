import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../l10n/generated/l10n.dart';

@immutable
class AppException extends Equatable implements Exception {
  const AppException(this.messages);

  AppException.fromJson(dynamic data) : this(_findErrors(data));

  final Set<String> messages;

  @override
  List<Object> get props => [messages];

  static Set<String> _findErrors(dynamic data) {
    return switch (data) {
      'Unauthorized' => {S.current.userNotAuthorized},
      {'errors': final Map errors} => errors.values.expand(_findErrors).toSet(),
      {'errors': final List errors} => errors.map((e) => e.toString()).toSet(),
      {'error': final error} => {error},
      _ => {},
    };
  }
}
