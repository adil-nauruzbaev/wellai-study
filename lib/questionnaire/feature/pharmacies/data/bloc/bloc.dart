import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/errors_getter.dart';
import '../sourse/pharmacy_api.dart';

part 'state.dart';
part 'event.dart';

class PharmaciesBloc extends Bloc<PharmaciesEvent, PharmaciesState> {
  PharmaciesBloc({
    required this.remote,
  }) : super(PharmaciesLoading()) {
    on<PharmaciesFetch>(_fetch);
  }

  final PharmacyApi remote;

  Future<void> _fetch(
    PharmaciesFetch event,
    Emitter<PharmaciesState> emit,
  ) async {
    try {
      emit(PharmaciesLoading());

      final response = await remote.fetchPharmacies();

      emit(PharmaciesData(data: response ?? []));
    } catch (error) {
      emit(
        PharmaciesError(
          error: errorToString(error),
        ),
      );
    }
  }
}
