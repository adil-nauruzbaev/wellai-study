class NewsModel {
  NewsModel({
    this.header,
    this.prefix,
    this.text,
    this.id,
    this.cabinetId,
    this.createdAt,
    this.image,
    this.imageId,
    this.link,
    this.updatedAt,
  });

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      id: json['id'],
      header: json['header'] ?? '',
      prefix: json['prefix'] ?? '',
      text: json['text'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      link: json['link'] ?? '',
      imageId: json['imageId'] ?? null,
      cabinetId: json['cabinetId'] ?? null,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
  final String? header;
  final int? id;
  final String? prefix;
  final String? text;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? link;
  final int? imageId;
  final int? cabinetId;
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
  factory ImageModel.fromJson(dynamic json) {
    return ImageModel(
      id: json['id'],
      blur: json['blur'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      name: json['name'],
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
