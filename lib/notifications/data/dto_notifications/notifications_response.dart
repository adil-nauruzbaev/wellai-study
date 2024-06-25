class NotificationsDto {
  NotificationsDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.body,
    this.description,
    this.status,
    this.type,
    this.userId,
    this.appType,
  });
  factory NotificationsDto.fromJson(dynamic json) {
    return NotificationsDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      title: json['title'],
      body: json['body'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      userId: json['userId'],
      appType: json['appType'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? body;
  final String? description;
  final String? status;
  final String? type;
  final int? userId;
  final String? appType;
}
