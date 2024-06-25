import 'dart:core';

import 'notifications_agreement.dart';
import 'notifications_appointment.dart';
import 'notifications_message.dart';
import 'notifications_note.dart';
import 'notifications_telehealth.dart';

class NotificationModel {
  NotificationModel({
    this.appType,
    this.body,
    this.createdAt,
    this.description,
    this.id,
    this.status,
    this.title,
    this.type,
    this.updatedAt,
    this.userId,
    this.notificationsAgreement,
    this.notificationsAppointment,
    this.notificationsMessage,
    this.notificationsNote,
    this.notificationsTelehealth,
    this.notificationsAgreementCount,
    this.notificationsAppointmentCount,
    this.notificationsMessageCount,
    this.notificationsNoteCount,
    this.notificationsTelehealthCount,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      userId: json['userId'],
      appType: json['appType'] ?? '',
      notificationsMessage: List<NotificationsMessage>.from(
        json['notificationsMessage']
            .map((x) => NotificationsMessage.fromJson(x)),
      ),
      notificationsAppointment: List<NotificationsAppointment>.from(
        json['notificationsAppointment']
            .map((x) => NotificationsAppointment.fromJson(x)),
      ),
      notificationsNote: List<NotificationsNote>.from(
        json['notificationsNote'].map((x) => NotificationsNote.fromJson(x)),
      ),
      notificationsAgreement: List<NotificationsAgreement>.from(
        json['notificationsAgreement']
            .map((x) => NotificationsAgreement.fromJson(x)),
      ),
      notificationsTelehealth: List<NotificationsTelehealth>.from(
        json['notificationsTelehealth']
            .map((x) => NotificationsTelehealth.fromJson(x)),
      ),
      notificationsMessageCount: json['notificationsMessage_count'],
      notificationsTelehealthCount: json['notificationsTelehealth_count'],
      notificationsAppointmentCount: json['notificationsAppointment_count'],
      notificationsNoteCount: json['notificationsNote_count'],
      notificationsAgreementCount: json['notificationsAgreement_count'],
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
  final List<NotificationsMessage>? notificationsMessage;
  final List<NotificationsAppointment>? notificationsAppointment;
  final List<NotificationsNote>? notificationsNote;
  final List<NotificationsAgreement>? notificationsAgreement;
  final List<NotificationsTelehealth>? notificationsTelehealth;
  final int? notificationsMessageCount;
  final int? notificationsAppointmentCount;
  final int? notificationsNoteCount;
  final int? notificationsAgreementCount;
  final int? notificationsTelehealthCount;
}
