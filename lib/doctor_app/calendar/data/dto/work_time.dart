import 'package:intl/intl.dart';

class WorkTime {
  WorkTime({
    this.appointments,
    this.appointmentsCount,
    this.id,
    this.time,
    this.work,
  });
  factory WorkTime.fromJson(Map<String, dynamic> json) {
    return WorkTime(
      id: json['id'] ?? null,
      time: DateFormat('HH:mm').parse(json['time'] ?? ''),
      work: json['work'] != null ? Work.fromJson(json['work']) : null,
      appointments: List<Appointments>.from(
          json['appointments'].map((x) => Appointments.fromJson(x))),
      appointmentsCount: json['appointmentsCount'] ?? null,
    );
  }
  final int? id;
  final DateTime? time;
  final Work? work;
  final List<Appointments>? appointments;
  final int? appointmentsCount;
}

class Work {
  Work({this.cabinet, this.date, this.id});
  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      id: json['id'],
      date: DateTime.tryParse(json['date'] ?? ''),
      cabinet:
          json['cabinet'] != null ? Cabinet.fromJson(json['cabinet']) : null,
    );
  }
  final int? id;
  final DateTime? date;
  final Cabinet? cabinet;
}

class Cabinet {
  Cabinet({this.stepWorkTime});
  factory Cabinet.fromJson(Map<String, dynamic> json) {
    return Cabinet(
      stepWorkTime: json['stepWorkTime'] ?? null,
    );
  }
  final int? stepWorkTime;
}

class Appointments {
  Appointments({
    this.doctorIsWas,
    this.id,
    this.patientIsWas,
    this.session,
    this.user,
  });
  factory Appointments.fromJson(Map<String, dynamic> json) {
    return Appointments(
      id: json['id'] ?? null,
      patientIsWas: json['patientIsWas'] ?? false,
      doctorIsWas: json['doctorIsWas'] ?? false,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      session:
          json['session'] != null ? Session.fromJson(json['session']) : null,
    );
  }
  final int? id;
  final bool? patientIsWas;
  final bool? doctorIsWas;
  final User? user;
  final Session? session;
}

class User {
  User({
    this.active,
    this.createdAt,
    this.currentCabinetId,
    this.deletedAt,
    this.disabledAt,
    this.firstEntry,
    this.id,
    this.online,
    this.profile,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      deletedAt: DateTime.tryParse(json['deletedAt'] ?? ''),
      online: json['online'] ?? false,
      firstEntry: json['firstEntry'] ?? false,
      disabledAt: DateTime.tryParse(json['disabledAt'] ?? ''),
      active: json['active'] ?? false,
      currentCabinetId: json['currentCabinetId'] ?? null,
      profile:
          json['profile'] != null ? Profile.fromJson(json['profile']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool? online;
  final bool? firstEntry;
  final DateTime? disabledAt;
  final bool? active;
  final int? currentCabinetId;
  final Profile? profile;
}

class Profile {
  Profile({this.firstName, this.lastName, this.image});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
  final String? firstName;
  final String? lastName;
  final ImageModel? image;
}

class ImageModel {
  ImageModel({
    this.id,
    this.blur,
    this.createdAt,
    this.name,
    this.path,
    this.updatedAt,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? null,
      blur: json['blur'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      name: json['name'] ?? '',
      path: json['path'] ?? '',
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? path;
  final String? name;
  final String? blur;
}

class Session {
  Session({
    this.id,
    this.isFinish,
    this.note,
  });
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      isFinish: json['isFinish'] ?? false,
      id: json['id'],
      note: json['note'] != null ? Note.fromJson(json['note']) : null,
    );
  }
  final bool? isFinish;
  final int? id;
  final Note? note;
}

class Note {
  Note({
    this.additional,
    this.adminFee,
    this.createdAt,
    this.header,
    this.id,
    this.insuranceId,
    this.level,
    this.sessionId,
    this.text,
    this.updatedAt,
    this.userId,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      header: json['header'] ?? '',
      text: json['text'] ?? '',
      additional: json['additional'] ?? '',
      level: json['level'],
      userId: json['userId'],
      insuranceId: json['insuranceId'],
      sessionId: json['sessionId'],
      adminFee: json['adminFee'] ?? null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? header;
  final String? text;
  final String? additional;
  final int? level;
  final int? userId;
  final int? insuranceId;
  final int? sessionId;
  final bool? adminFee;
}
