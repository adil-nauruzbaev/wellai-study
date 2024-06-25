import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/l10n/source/local_storage.dart';

part 'state.dart';
part 'event.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc({
    required this.local,
  }) : super(InitialLoading()) {
    on<InitialInit>(_init);
  }

  final LocalStorage local;

  Future<void> _init(
    InitialInit event,
    Emitter<InitialState> emit,
  ) async {
    try {
      final token = local.read('token');
      final role = local.read('role');

      if (token == null) {
        emit(InitialUnauth());
      } else {
        emit(
          InitialAuth(
            token: '$token',
            role: '${role ?? ''}',
          ),
        );
      }
    } catch (error) {}
  }
}
