// ignore_for_file: non_constant_identifier_names
import '../../../../../shared/dto/profile_dto.dart';

class ProfileInfoDTO {
  ProfileInfoDTO({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.email,
    this.online,
    this.firstEntry,
    this.appType,
    this.disabledAt,
    this.active,
    this.currentCabinetId,
    this.confirm,
    this.cabinets,
    this.roles,
    this.profile,
    this.invites,
    this.cabinets_count,
    this.roles_count,
    this.invites_count,
  });
  factory ProfileInfoDTO.fromJson(dynamic json) {
    return ProfileInfoDTO(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.tryParse(json['deletedAt']) : null,
      email: json['email'],
      online: json['online'],
      firstEntry: json['firstEntry'],
      appType: json['appType'],
      disabledAt: DateTime.tryParse(json['disabledAt']),
      active: json['active'],
      currentCabinetId: json['currentCabinetId'],
      confirm: json['confirm'] != null ? ConfirmDto.fromJson(json['confirm']) : null,
      cabinets: json['cabinets'] != null ? (json['cabinets'] as List).map(CabinetsDto.fromJson).toList() : null,
      roles: json['roles'] != null ? (json['roles'] as List).map(RolesDto.fromJson).toList() : null,
      profile: json['profile'] != null ? ProfileResponseDto.fromJson(json['profile']) : null,
      invites: json['invites'] != null ? List<String>.from(json['invites']) : null,
      cabinets_count: json['cabinets_count'],
      roles_count: json['roles_count'],
      invites_count: json['invites_count'],
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
  final ConfirmDto? confirm;
  final List<CabinetsDto>? cabinets;
  final List<RolesDto>? roles;
  final ProfileResponseDto? profile;
  final List<String>? invites;
  final int? cabinets_count;
  final int? roles_count;
  final int? invites_count;
}

class RolesDto {
  RolesDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.prefix,
    this.fixed,
  });

  factory RolesDto.fromJson(dynamic json) {
    return RolesDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      name: json['name'],
      prefix: json['prefix'],
      fixed: json['fixed'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? prefix;

  final bool? fixed;
}

class ConfirmDto {
  ConfirmDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.confirmed,
    this.userId,
  });
  factory ConfirmDto.fromJson(dynamic json) {
    return ConfirmDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      code: json['code'],
      confirmed: json['confirmed'],
      userId: json['userId'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? code;
  final bool? confirmed;
  final int? userId;
}

class CabinetsDto {
  CabinetsDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.stepWorkTime,
    this.firebaseApp,
    this.firebaseApnDoctor,
    this.firebaseIosDoctor,
    this.firebaseApnPatient,
    this.firebaseIosPatient,
    this.smtpHost,
    this.smtpPort,
    this.smtpUser,
    this.smtpPassword,
    this.smtpSecure,
    this.smtpSendPerHour,
    this.contacts,
  });
  factory CabinetsDto.fromJson(dynamic json) {
    return CabinetsDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      name: json['name'],
      stepWorkTime: json['stepWorkTime'],
      firebaseApp: json['firebaseApp'],
      firebaseApnDoctor: json['firebaseApnDoctor'],
      firebaseIosDoctor: json['firebaseIosDoctor'],
      firebaseApnPatient: json['firebaseApnPatient'],
      firebaseIosPatient: json['firebaseIosPatient'],
      smtpHost: json['smtpHost'],
      smtpPort: json['smtpPort'],
      smtpUser: json['smtpUser'],
      smtpPassword: json['smtpPassword'],
      smtpSecure: json['smtpSecure'],
      smtpSendPerHour: json['smtpSendPerHour'],
      contacts: json['contacts'] != null ? ContactsDto.fromJson(json['contacts']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? stepWorkTime;
  final String? firebaseApp;
  final String? firebaseApnDoctor;
  final String? firebaseIosDoctor;
  final String? firebaseApnPatient;
  final String? firebaseIosPatient;
  final String? smtpHost;
  final int? smtpPort;
  final String? smtpUser;
  final String? smtpPassword;
  final bool? smtpSecure;
  final int? smtpSendPerHour;
  final ContactsDto? contacts;
}

class ContactsDto {
  ContactsDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.startWork,
    this.closeWork,
    this.phone,
    this.emails,
    this.billingDepartmentEmails,
    this.website,
    this.timezone,
    this.cabinetId,
    this.logoId,
  });
  factory ContactsDto.fromJson(dynamic json) {
    return ContactsDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      address: json['address'],
      startWork: DateTime.tryParse(json['startWork']),
      closeWork: DateTime.tryParse(json['closeWork']),
      phone: json['phone'],
      emails: json['emails'] != null ? List<String>.from(json['emails']) : null,
      billingDepartmentEmails: json['billingDepartmentEmails'] != null ? List<String>.from(json['billingDepartmentEmails']) : null,
      website: json['website'],
      timezone: json['timezone'],
      cabinetId: json['cabinetId'],
      logoId: json['logoId'],
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? address;
  final DateTime? startWork;
  final DateTime? closeWork;
  final String? phone;
  final List<String>? emails;
  final List<String>? billingDepartmentEmails;
  final String? website;
  final String? timezone;
  final int? cabinetId;
  final int? logoId;
}
