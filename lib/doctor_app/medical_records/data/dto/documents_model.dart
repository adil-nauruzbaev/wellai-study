import '../../../notifications/data/dto/notifications_appointment.dart';
import 'categories_model.dart';

class DocumentsModel {
  DocumentsModel({
    this.byClinic,
    this.categoryId,
    this.category,
    this.createdAt,
    this.dateOfEvent,
    this.files,
    this.filesCount,
    this.header,
    this.histories,
    this.id,
    this.ownerId,
    this.updatedAt,
    this.user,
    this.userId,
  });
  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return DocumentsModel(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      header: json['header'] ?? '',
      categoryId: json['categoryId'] ?? null,
      dateOfEvent: DateTime.tryParse(json['dateOfEvent'] ?? ''),
      userId: json['userId'] ?? null,
      ownerId: json['ownerId'] ?? null,
      byClinic: json['byClinic'] ?? false,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      files: json['files'] != null
          ? List<Files>.from(
              json['files'].map((x) => Files.fromJson(x)),
            )
          : [],
      category: json['category'] != null
          ? CategoriesModel.fromJson(json['category'])
          : null,
      histories: json['files'] != null
          ? List<Histories>.from(
              json['histories'].map((x) => Histories.fromJson(x)),
            )
          : [],
      filesCount: json['files_count'] ?? null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? header;
  final int? categoryId;
  final DateTime? dateOfEvent;
  final int? userId;
  final int? ownerId;
  final bool? byClinic;
  final User? user;
  final List<Files>? files;
  final CategoriesModel? category;
  final List<Histories>? histories;
  final int? filesCount;
}

class Files {
  Files({this.createdAt, this.id, this.name, this.path, this.updatedAt});
  factory Files.fromJson(Map<String, dynamic> json) {
    return Files(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      path: json['path'] ?? '',
      name: json['name'] ?? '',
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? path;
  final String? name;
}

class Histories {
  Histories({
    this.createdAt,
    this.documentId,
    this.id,
    this.physicianId,
    this.type,
    this.updatedAt,
    this.userId,
  });
  factory Histories.fromJson(Map<String, dynamic> json) {
    return Histories(
      id: json['id'] ?? null,
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      type: json['type'] ?? '',
      userId: json['userId'] ?? null,
      documentId: json['documentId'] ?? null,
      physicianId: json['physicianId'] ?? null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? type;
  final int? userId;
  final int? documentId;
  final int? physicianId;
}
