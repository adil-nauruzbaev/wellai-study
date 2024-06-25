import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../../shared/errors_getter.dart';
import '../physiciams_api.dart';
import '../physician_patch_dto.dart';
import '../physicians_dto.dart';

part 'event.dart';
part 'state.dart';

class PhysiciansBloc extends Bloc<PhysiciansEvent, PhysiciansState> {
  PhysiciansBloc(this.physiciansApi) : super(PhysiciansInitial(physicians: [])) {
    on<FetchPhysicians>(_getPhysicians);
    on<EditPhysicians>(_patchPhysicians);
    on<DeletePhysicians>(_deletePhysicians);
  }
  final PhysiciansApi physiciansApi;

  Future<void> _getPhysicians(
    FetchPhysicians event,
    Emitter<PhysiciansState> emit,
  ) async {
    try {
      emit(PhysiciansLoading(physicians: []));
      final physicians = await physiciansApi.getPhysicians();
      emit(PhysiciansData(physicians: physicians));
    } catch (error) {
      emit(
        PhysiciansError(
          error: errorToString(error),
          physicians: state.physicians,
        ),
      );
      rethrow;
    }
  }

  Future<void> _patchPhysicians(
    EditPhysicians event,
    Emitter<PhysiciansState> emit,
  ) async {
    try {
      emit(PhysiciansLoading(physicians: []));
      await physiciansApi.patchPhysicians(
        event.patchPhysDTO,
        event.id,
      );
      emit(PhysiciansPatchSuccesc(physicians: []));
    } catch (error) {
      PhysiciansError(
        error: errorToString(error),
        physicians: [],
      );
      rethrow;
    }
  }

  Future<void> _deletePhysicians(
    DeletePhysicians event,
    Emitter<PhysiciansState> emit,
  ) async {
    try {
      emit(PhysiciansLoading(physicians: []));
      await physiciansApi.deletePysician(event.id);
      final physicians = await physiciansApi.getPhysicians();
      emit(PhysiciansData(physicians: physicians));
    } catch (error) {
      emit(
        PhysiciansError(
          error: errorToString(error),
          physicians: [],
        ),
      );
    }
  }
}
