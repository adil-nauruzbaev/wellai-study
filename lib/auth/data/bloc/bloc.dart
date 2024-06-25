import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/errors_getter.dart';
import '../../../shared/l10n/source/local_storage.dart';
import '../sourse/auth_api.dart';

part 'state.dart';
part 'event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.remote,
    required this.local,
  }) : super(AuthInitial()) {
    on<AuthSignIn>(_signIn);
  }

  final AuthApi remote;
  final LocalStorage local;

  Future<void> _signIn(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final response = await remote.signIn(
        event.login,
        event.pass,
        event.isDoctor,
      );

      local.write('token', response.accessToken ?? '');

      emit(AuthSuccess(token: response.accessToken ?? ''));
    } catch (error) {
      emit(
        AuthError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
