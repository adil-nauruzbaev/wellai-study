import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/errors_getter.dart';
import '../sourse/States_api.dart';

part 'state.dart';
part 'event.dart';

class StatesUsBloc extends Bloc<StatesUsEvent, StatesUsState> {
  StatesUsBloc({
    required this.remote,
  }) : super(StatesUsLoading()) {
    on<StatesUsFetch>(_fetch);
    on<StateSearch>(_search);
  }

  final StatesApi remote;

  Future<void> _fetch(
    StatesUsFetch event,
    Emitter<StatesUsState> emit,
  ) async {
    try {
      emit(StatesUsLoading());

      final response = await remote.fetchStatesUs();

      emit(StatesUsData(data: response ?? []));
    } catch (error) {
      emit(
        StatesUsError(
          error: errorToString(error),
        ),
      );
    }
  }

  Future<void> _search(
    StateSearch event,
    Emitter<StatesUsState> emit,
  ) async {
    //TODO доработать
    try {
      if (state is StatesUsData) {
        final data = (state as StatesUsData).data;
        final result = <String>[];

        for (final element in data) {
          if (element.contains(event.query)) {
            result.add(element);
          }
        }

        emit(StatesUsData(data: result));
      }
    } catch (error) {
      emit(
        StatesUsError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
