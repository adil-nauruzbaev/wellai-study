part of 'bloc.dart';

sealed class PersonalInfoState {}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoData extends PersonalInfoState {
  PersonalInfoData(this.personalInfo);
  final ProfileInfoDTO personalInfo;
}

class PersonalInfoPatch extends PersonalInfoState {}

class PersonalInfoSuccesc extends PersonalInfoState {}

class PersonalInfoError extends PersonalInfoState with EquatableMixin {
  PersonalInfoError({
    required this.error,
  });
  final String error;
  @override
  List<Object> get props => [error];
}
