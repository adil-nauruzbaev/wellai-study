class NewsResponseDto {
  NewsResponseDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.header,
    this.text,
    this.prefix,
    this.link,
    this.imageId,
    this.cabinetId,
    this.image,
  });
  factory NewsResponseDto.fromJson(dynamic json) {
    return NewsResponseDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      header: json['header'],
      text: json['text'],
      prefix: json['prefix'],
      link: json['link'],
      imageId: json['imageId'],
      cabinetId: json['cabinetId'],
      image: json['image'] != null ? ImageDto.fromJson(json['image']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? header;
  final String? text;
  final String? prefix;
  final String? link;
  final int? imageId;
  final int? cabinetId;
  final ImageDto? image;
}

class ImageDto {
  ImageDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.path,
    this.name,
    this.blur,
  });
  factory ImageDto.fromJson(dynamic json) {
    return ImageDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
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
