class DriverLicenseFrontImageDto {
  DriverLicenseFrontImageDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.path,
    this.name,
    this.blur,
  });
  factory DriverLicenseFrontImageDto.fromJson(dynamic json) {
    return DriverLicenseFrontImageDto(
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
