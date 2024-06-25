part of 'bloc.dart';

abstract class PersonalInfoEvent {}

class FetchPersonalInfo extends PersonalInfoEvent {}

class PatchPersonalInfo extends PersonalInfoEvent {
  PatchPersonalInfo(
    this.patchInfoDTO,
    this.id,
  );
  final PatchInfoDTO patchInfoDTO;
  final int id;
}
