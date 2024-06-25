import 'dart:core';

class NotificationsAppointment {
  NotificationsAppointment({
    this.appointment,
    this.appointmentId,
    this.createdAt,
    this.id,
    this.notificationId,
    this.updatedAt,
  });
  factory NotificationsAppointment.fromJson(Map<String, dynamic> json) {
    return NotificationsAppointment(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      notificationId: json['notificationId'],
      appointmentId: json['appointmentId'],
      appointment: json['appointment'] != null
          ? Appointment.fromJson(json['appointment'])
          : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? notificationId;
  final int? appointmentId;
  final Appointment? appointment;
}

class Appointment {
  Appointment({
    this.canceledDate,
    this.comment,
    this.createdAt,
    this.doctorIsJoin,
    this.doctorIsWas,
    this.id,
    this.isCancelled,
    this.noShow,
    this.noShowComment,
    this.notified,
    this.patientIsJoin,
    this.patientIsWas,
    this.session,
    this.sessionId,
    this.updatedAt,
    this.user,
    this.userId,
    this.workTime,
    this.workTimeId,
  });
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      userId: json['userId'],
      sessionId: json['sessionId'],
      workTimeId: json['workTimeId'],
      notified: json['notified'] ?? false,
      comment: json['comment'] ?? '',
      isCancelled: json['isCancelled'] ?? false,
      canceledDate: DateTime.tryParse(json['canceledDate'] ?? ''),
      noShowComment: json['noShowComment'] ?? '',
      noShow: json['noShow'] ?? false,
      patientIsJoin: json['patientIsJoin'] ?? false,
      doctorIsJoin: json['doctorIsJoin'] ?? false,
      patientIsWas: json['patientIsWas'] ?? false,
      doctorIsWas: json['doctorIsWas'] ?? false,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      workTime:
          json['workTime'] != null ? WorkTime.fromJson(json['workTime']) : null,
      session:
          json['session'] != null ? Session1.fromJson(json['session']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  final int? sessionId;
  final int? workTimeId;
  final bool? notified;
  final String? comment;
  final bool? isCancelled;
  final DateTime? canceledDate;
  final String? noShowComment;
  final bool? noShow;
  final bool? patientIsJoin;
  final bool? doctorIsJoin;
  final bool? patientIsWas;
  final bool? doctorIsWas;
  final User? user;
  final WorkTime? workTime;
  final Session1? session;
}

class Session1 {
  Session1({
    this.chatId,
    this.createdAt,
    this.id,
    this.isFinish,
    this.note,
    this.updatedAt,
    this.userId,
  });
  factory Session1.fromJson(Map<String, dynamic> json) {
    return Session1(
      isFinish: json['isFinish'] ?? false,
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      userId: json['userId'],
      chatId: json['chatId'],
      note: json['note'] != null ? Note.fromJson(json['note']) : null,
    );
  }
  final bool? isFinish;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  final int? chatId;
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
      additional: json['additional'],
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

class WorkTime {
  WorkTime({
    this.createdAt,
    this.id,
    this.time,
    this.updatedAt,
    this.work,
    this.workId,
  });
  factory WorkTime.fromJson(Map<String, dynamic> json) {
    return WorkTime(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      workId: json['workId'],
      time: DateTime.tryParse(json['time'] ?? ''),
      work: json['work'] != null ? Work.fromJson(json['work']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? workId;
  final DateTime? time;
  final Work? work;
}

class Work {
  Work({
    this.cabinetId,
    this.createdAt,
    this.date,
    this.id,
    this.updatedAt,
    this.user,
    this.userId,
  });
  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      date: DateTime.tryParse(json['date'] ?? ''),
      userId: json['userId'],
      cabinetId: json['cabinetId'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? date;
  final int? userId;
  final int? cabinetId;
  final User? user;
}

class User {
  User({
    this.active,
    this.appType,
    this.createdAt,
    this.currentCabinetId,
    this.deletedAt,
    this.disabledAt,
    this.email,
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
      email: json['email'] ?? '',
      online: json['online'] ?? false,
      firstEntry: json['firstEntry'] ?? false,
      appType: json['appType'] ?? '',
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
  final String? email;
  final bool? online;
  final bool? firstEntry;
  final String? appType;
  final DateTime? disabledAt;
  final bool? active;
  final int? currentCabinetId;
  final Profile? profile;
}

class Profile {
  Profile({
    this.bio,
    this.biologicalSex,
    this.chronicDiseasesAndAllergies,
    this.city,
    this.createdAt,
    this.creditCardNumber,
    this.dateOfBirth,
    this.diagnosis,
    this.driverLicenseBackImageId,
    this.driverLicenseFrontImageId,
    this.firstName,
    this.id,
    this.imageId,
    this.insuranceBackImageId,
    this.insuranceFrontImageId,
    this.lastName,
    this.lengthOfWork,
    this.medications,
    this.pharmacyAddress,
    this.pharmacyName,
    this.pharmacyPhone,
    this.phone,
    this.preferredName,
    this.profileWasFilled,
    this.qualification,
    this.state,
    this.streetAddress,
    this.streetAddress2,
    this.tags,
    this.updatedAt,
    this.userId,
    this.zipCode,
    this.feedbackNotification,
    this.image,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      preferredName: json['preferredName'] ?? '',
      profileWasFilled: json['profileWasFilled'] ?? null,
      biologicalSex: json['biologicalSex'] ?? '',
      dateOfBirth: DateTime.tryParse(json['dateOfBirth'] ?? ''),
      chronicDiseasesAndAllergies: json['chronicDiseasesAndAllergies'] ?? '',
      phone: json['phone'] ?? '',
      pharmacyPhone: json['pharmacyPhone'] ?? '',
      bio: json['bio'] ?? '',
      medications: json['medications'] ?? '',
      userId: json['userId'] ?? null,
      imageId: json['imageId'] ?? null,
      driverLicenseFrontImageId: json['driverLicenseFrontImageId'] ?? null,
      driverLicenseBackImageId: json['driverLicenseBackImageId'] ?? null,
      insuranceFrontImageId: json['insuranceFrontImageId'] ?? null,
      insuranceBackImageId: json['insuranceBackImageId'] ?? null,
      creditCardNumber: json['creditCardNumber'] ?? '',
      qualification: json['qualification'] ?? '',
      lengthOfWork: json['lengthOfWork'] ?? null,
      streetAddress: json['streetAddress'] ?? '',
      streetAddress2: json['streetAddress2'] ?? '',
      feedbackNotification: json['feedbackNotification'] ?? false,
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zipCode'] ?? '',
      pharmacyName: json['pharmacyName'] ?? '',
      pharmacyAddress: json['pharmacyAddress'] ?? '',
      tags: json['tags'] ?? [],
      diagnosis: json['diagnosis'] ?? [],
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstName;
  final String? lastName;
  final String? preferredName;
  final bool? profileWasFilled;
  final String? biologicalSex;
  final DateTime? dateOfBirth;
  final String? chronicDiseasesAndAllergies;
  final String? phone;
  final String? pharmacyPhone;
  final String? bio;
  final String? medications;
  final int? userId;
  final int? imageId;
  final int? driverLicenseFrontImageId;
  final int? driverLicenseBackImageId;
  final int? insuranceFrontImageId;
  final int? insuranceBackImageId;
  final String? creditCardNumber;
  final String? qualification;
  final int? lengthOfWork;
  final String? streetAddress;
  final String? streetAddress2;
  final bool? feedbackNotification;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? pharmacyName;
  final String? pharmacyAddress;
  final List<dynamic>? tags;
  final List<dynamic>? diagnosis;
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
