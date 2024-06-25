import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/errors_getter.dart';
import '../dto/patch_info_dto.dart';
import '../source/profile_info_api.dart';
import '../dto/profile_info_dto.dart';

part 'event.dart';
part 'state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc(this.profileInfoApi) : super(PersonalInfoInitial()) {
    on<FetchPersonalInfo>(_getPersonalInfo);
    on<PatchPersonalInfo>(_patchPersonalInfo);
  }
  final ProfileInfoApi profileInfoApi;

  Future<void> _getPersonalInfo(
    FetchPersonalInfo event,
    Emitter<PersonalInfoState> emit,
  ) async {
    try {
      emit(PersonalInfoLoading());
      final personalInfo = await profileInfoApi.getProgileInfos();
      emit(PersonalInfoData(personalInfo));
    } catch (error) {
      PersonalInfoError(
        error: errorToString(error),
      );
      rethrow;
    }
  }

  Future<void> _patchPersonalInfo(
    PatchPersonalInfo event,
    Emitter<PersonalInfoState> emit,
  ) async {
    try {
      emit(PersonalInfoLoading());
      await profileInfoApi.patchProileInfo(
        event.patchInfoDTO,
        event.id,
      );
      emit(PersonalInfoSuccesc());
    } catch (error) {
      PersonalInfoError(
        error: errorToString(error),
      );
      rethrow;
    }
  }
}
