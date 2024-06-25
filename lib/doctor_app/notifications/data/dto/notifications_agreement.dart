class NotificationsAgreement {
  NotificationsAgreement({
    this.agreementId,
    this.createdAt,
    this.id,
    this.notificationId,
    this.updatedAt,
  });
  factory NotificationsAgreement.fromJson(Map<String, dynamic> json) {
    return NotificationsAgreement(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      notificationId: json['notificationId'],
      agreementId: json['agreementId'],
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? notificationId;
  final int? agreementId;
}
