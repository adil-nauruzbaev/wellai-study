import '../../shared/dto/user_dto.dart';

class WorkThDTO {
  WorkThDTO({
    this.worktime,
    this.count,
  });
  factory WorkThDTO.fromJson(dynamic json) {
    return WorkThDTO(
      worktime: json['worktime'] != null ? (json['worktime'] as List).map(WorkTimeDTO.fromJson).toList() : null,
      count: json['count'],
    );
  }

  final List<WorkTimeDTO>? worktime;
  final int? count;
}

class WorkTimeDTO {
  WorkTimeDTO({
    this.id,
    this.time,
    this.work,
    this.cabinet,
  });
  factory WorkTimeDTO.fromJson(dynamic json) {
    return WorkTimeDTO(
      id: json['id'],
      time: json['time'],
      work: json['work'] != null ? WorkDto.fromJson(json['work']) : null,
      cabinet: json['cabinet'] != null ? CabintDto.fromJson(json['cabinet']) : null,
    );
  }

  final int? id;
  final String? time;
  final WorkDto? work;
  final CabintDto? cabinet;
}

class WorkDto {
  WorkDto({
    this.id,
    this.date,
    this.user,
    this.cabinet,
    this.appointments,
  });
  factory WorkDto.fromJson(dynamic json) {
    return WorkDto(
      id: json['id'],
      date: json['date'],
      user: json['user'] != null ? UserResponceDto.fromJson(json['user']) : null,
      cabinet: json['cabinet'] != null ? CabintDto.fromJson(json['cabinet']) : null,
      appointments:
          json['appointments'] != null ? (json['appointments'] as List).map(AppointmentsDto.fromJson).toList() : null,
    );
  }
  final int? id;
  final String? date;
  final UserResponceDto? user;
  final CabintDto? cabinet;
  final List<AppointmentsDto>? appointments;
}

class AppointmentsDto {
  AppointmentsDto({
    this.id,
    this.isCancelled,
    this.noShow,
  });
  factory AppointmentsDto.fromJson(dynamic json) {
    return AppointmentsDto(
      id: json['id'],
      isCancelled: json['isCancelled'],
      noShow: json['noShow'],
    );
  }
  final int? id;
  final bool? isCancelled;
  final bool? noShow;
}

class CabintDto {
  CabintDto({this.stepWorkTime});
  factory CabintDto.fromJson(dynamic json) {
    return CabintDto(
      stepWorkTime: json['stepWorkTime'],
    );
  }
  final int? stepWorkTime;
}
