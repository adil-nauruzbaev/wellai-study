class QualifificationDTO {
  QualifificationDTO({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.order,
  });
  factory QualifificationDTO.fromJson(dynamic json) {
    return QualifificationDTO(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      name: json['name'],
      order: json['order'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? order;
}
