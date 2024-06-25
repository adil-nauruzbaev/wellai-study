import 'news_response.dart';

class StoriesResponseDto {
  StoriesResponseDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.title,
    this.active,
    this.description,
    this.prefix,
    this.externalLink,
    this.externalSecondLink,
    this.buttonLink,
    this.buttonPrimary,
    this.buttonTitle,
    this.buttonSecondLink,
    this.buttonSecondTitle,
    this.buttonSecondPrimary,
    this.thumbnailId,
    this.thumbnailTitle,
    this.imageId,
    this.cabinetId,
    this.image,
    this.thumbnail,
  });
  factory StoriesResponseDto.fromJson(dynamic json) {
    return StoriesResponseDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      order: json['order'],
      title: json['title'],
      active: json['active'],
      description: json['description'],
      prefix: json['prefix'],
      externalLink: json['externalLink'],
      externalSecondLink: json['externalSecondLink'],
      buttonLink: json['buttonLink'],
      buttonPrimary: json['buttonPrimary'],
      buttonTitle: json['buttonTitle'],
      buttonSecondLink: json['buttonSecondLink'],
      buttonSecondTitle: json['buttonSecondTitle'],
      buttonSecondPrimary: json['buttonSecondPrimary'],
      thumbnailId: json['thumbnailId'],
      imageId: json['imageId'],
      cabinetId: json['cabinetId'],
      image: json['image'] != null ? ImageDto.fromJson(json['image']) : null,
      thumbnail: json['thumbnail'] != null ? ImageDto.fromJson(json['thumbnail']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? order;
  final String? title;
  final bool? active;
  final String? description;
  final String? prefix;
  final String? externalLink;
  final String? externalSecondLink;
  final String? buttonLink;
  final bool? buttonPrimary;
  final String? buttonTitle;
  final String? buttonSecondLink;
  final String? buttonSecondTitle;
  final bool? buttonSecondPrimary;
  final int? thumbnailId;
  final String? thumbnailTitle;
  final int? imageId;
  final int? cabinetId;
  final ImageDto? image;
  final ImageDto? thumbnail;
}

class IdDTO {
  IdDTO({
    this.statusCode,
    this.message,
    this.path,
    this.method,
    this.error,
  });
  factory IdDTO.fromJson(dynamic json) {
    return IdDTO(
      statusCode: json['statusCode'],
      path: json['path'],
      message: json['message'],
      error: json['error'],
      method: json['method'],
    );
  }
  final String? method;
  final String? path;
  final String? message;
  final int? statusCode;
  final String? error;
}
