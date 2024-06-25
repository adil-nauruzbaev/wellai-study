import 'profile_dto.dart';

class UserResponceDto {
  UserResponceDto({
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
    this.profile,
  });
  factory UserResponceDto.fromJson(dynamic json) {
    return UserResponceDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      deletedAt: DateTime.tryParse(json['deletedAt'] ?? ''),
      email: json['email'],
      online: json['online'],
      firstEntry: json['firstEntry'],
      appType: json['appType'],
      disabledAt: DateTime.tryParse(json['disabledAt'] ?? ''),
      active: json['active'],
      currentCabinetId: json['currentCabinetId'],
      profile: json['profile'] != null ? ProfileResponseDto.fromJson(json['profile']) : null,
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
  final ProfileResponseDto? profile;
}
