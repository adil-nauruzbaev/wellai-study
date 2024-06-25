class NotificationsTelehealth {
  NotificationsTelehealth({
    this.createdAt,
    this.data,
    this.id,
    this.notificationId,
    this.updatedAt,
  });
  factory NotificationsTelehealth.fromJson(Map<String, dynamic> json) {
    return NotificationsTelehealth(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      notificationId: json['notificationId'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? notificationId;
  final Data? data;
}

class Data {
  Data({
    this.appointmentDate,
    this.canceledDate,
    this.comment,
    this.firstName,
    this.id,
    this.isCancelled,
    this.lastName,
    this.noShow,
    this.noShowComment,
    this.notified,
    this.sessionId,
    this.stepWorkTime,
    this.userId,
    this.workTimeId,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userId: json['userId'],
      sessionId: json['sessionId'],
      workTimeId: json['workTimeId'],
      notified: json['notified'] ?? false,
      comment: json['comment'] ?? '',
      isCancelled: json['isCancelled'] ?? false,
      canceledDate: DateTime.tryParse(json['canceledDate'] ?? ''),
      noShowComment: json['noShowComment'] ?? '',
      noShow: json['noShow'] ?? false,
      appointmentDate: DateTime.tryParse(json['appointmentDate'] ?? ''),
      stepWorkTime: json['stepWorkTime'],
    );
  }
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? userId;
  final int? sessionId;
  final int? workTimeId;
  final bool? notified;
  final String? comment;
  final bool? isCancelled;
  final DateTime? canceledDate;
  final String? noShowComment;
  final bool? noShow;
  final DateTime? appointmentDate;
  final int? stepWorkTime;
}
