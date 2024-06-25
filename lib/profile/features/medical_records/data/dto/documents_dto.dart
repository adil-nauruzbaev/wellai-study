import '../../../../../shared/dto/user_dto.dart';

class DocumentResponceDto {
  DocumentResponceDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.header,
    this.categoryId,
    this.dateOfEvent,
    this.ownerId,
    this.byClinic,
    this.userId,
    this.user,
    this.files,
    this.category,
  });

  factory DocumentResponceDto.fromJson(dynamic json) {
    return DocumentResponceDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      header: json['header'],
      categoryId: json['categoryId'],
      dateOfEvent: DateTime.tryParse(json['dateOfEvent']),
      ownerId: json['ownerId'],
      userId: json['userId'],
      byClinic: json['byClinic'],
      user: json['user'] != null ? UserResponceDto.fromJson(json['user']) : null,
      files: json['files'] != null ? (json['files'] as List).map(FilesDto.fromJson).toList() : null,
      category: json['category'] != null ? CategoryDto.fromJson(json['category']) : null,
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? header;
  final int? categoryId;
  final DateTime? dateOfEvent;
  final int? ownerId;
  final int? userId;
  final bool? byClinic;
  final UserResponceDto? user;
  final List<FilesDto>? files;
  final CategoryDto? category;
}

class FilesDto {
  FilesDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.path,
    this.name,
  });

  factory FilesDto.fromJson(dynamic json) {
    return FilesDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      path: json['path'],
      name: json['name'],
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? path;
  final String? name;
}

class CategoryDto {
  CategoryDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory CategoryDto.fromJson(dynamic json) {
    return CategoryDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      name: json['name'],
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
}
