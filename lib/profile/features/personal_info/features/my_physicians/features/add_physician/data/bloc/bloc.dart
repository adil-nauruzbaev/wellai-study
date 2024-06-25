import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../shared/errors_getter.dart';
import '../qualifification_api.dart';
import '../dto/qualifification_dto.dart';

part 'event.dart';
part 'state.dart';

class QualifificationBloc extends Bloc<QualifificationEvent, QualifificationState> {
  QualifificationBloc(this.qualifificationApi) : super(QualifificationInitial()) {
    on<FetchQualiffication>(_getQualifification);
  }

  final QualifificationApi qualifificationApi;

  Future<void> _getQualifification(
    FetchQualiffication event,
    Emitter<QualifificationState> emit,
  ) async {
    try {
      emit(QualifificationLoading());
      final qualifification = await qualifificationApi.getQualiffications();
      emit(QualifificationData(qualifification));
    } catch (error) {
      emit(
        QualifificationError(
          error: errorToString(error),
        ),
      );
      rethrow;
    }
  }
}
