class InsuranceFrontImageDto {
  InsuranceFrontImageDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.path,
    this.name,
    this.blur,
  });
  factory InsuranceFrontImageDto.fromJson(dynamic json) {
    return InsuranceFrontImageDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      path: json['path'],
      name: json['name'],
      blur: json['blur'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? path;
  final String? name;
  final String? blur;
}
