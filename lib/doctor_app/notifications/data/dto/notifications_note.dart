class NotificationsNote {
  NotificationsNote({
    this.callDate,
    this.createdAt,
    this.id,
    this.notificationId,
    this.sessionId,
    this.updatedAt,
    this.session,
  });
  factory NotificationsNote.fromJson(Map<String, dynamic> json) {
    return NotificationsNote(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      notificationId: json['notificationId'],
      sessionId: json['sessionId'],
      callDate: DateTime.tryParse(json['callDate'] ?? ''),
      session:
          json['session'] != null ? Session.fromJson(json['session']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? notificationId;
  final int? sessionId;
  final DateTime? callDate;
  final Session? session;
}

class Session {
  Session({
    this.chatId,
    this.createdAt,
    this.id,
    this.isFinish,
    this.user,
    this.updatedAt,
    this.userId,
  });
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      isFinish: json['isFinish'] ?? false,
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      userId: json['userId'],
      chatId: json['chatId'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
  final bool? isFinish;
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userId;
  final int? chatId;
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
      id: json['id'],
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
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      preferredName: json['preferredName'] ?? '',
      profileWasFilled: json['profileWasFilled'] ?? null,
      biologicalSex: json['biologicalSex'] ?? '',
      dateOfBirth: DateTime.tryParse(json['dateOfBirth'] ?? ''),
      chronicDiseasesAndAllergies: json['chronicDiseasesAndAllergies'],
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
}
