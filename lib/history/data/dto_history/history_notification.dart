// ignore_for_file: non_constant_identifier_names

class HistoryDto {
  HistoryDto(
      {this.session_id,
      this.session_createdAt,
      this.chat_id,
      this.chat_type,
      this.chat_user_id,
      this.chat_user_profile_firstName,
      this.chat_user_profile_lastName,
      this.chat_user_profile_degree,
      this.chat_user_profile_image_name,
      this.chat_user_profile_image_blur,
      this.chat_message,
      this.chat_message_createdAt,
      this.chat_message_type,
      this.chat_unread_messages_count,
      this.chat_closed,
      this.appointment_date,
      this.call_date,
      this.assistant_id,
      this.call_status,
      this.call_user_profile_image_name,
      this.call_user_profile_image_blur,
      this.assistant_symptoms});
  factory HistoryDto.fromJson(dynamic json) {
    return HistoryDto(
      session_id: json['session_id'],
      session_createdAt: DateTime.tryParse(json['session_createdAt']),
      chat_id: json['chat_id'],
      chat_type: json['chat_type'],
      chat_user_id: json['chat_user_id'],
      chat_user_profile_firstName: json['chat_user_profile_firstName'],
      chat_user_profile_lastName: json['chat_user_profile_lastName'],
      chat_user_profile_degree: json['chat_user_profile_degree'],
      chat_user_profile_image_name: json['chat_user_profile_image_name'],
      chat_user_profile_image_blur: json['chat_user_profile_image_blur'],
      chat_message: json['chat_message'],
      chat_message_createdAt: DateTime.tryParse(json['chat_message_createdAt'] ?? ''),
      chat_message_type: json['chat_message_type'],
      chat_unread_messages_count: json['chat_unread_messages_count'],
      chat_closed: json['chat_closed'],
      appointment_date: DateTime.tryParse(json['session_createdAt']),
      call_date: DateTime.tryParse(json['session_createdAt']),
      assistant_id: json['assistant_id'],
      call_status: json['call_status'],
      call_user_profile_image_name: json['call_user_profile_image_name'],
      call_user_profile_image_blur: json['call_user_profile_image_blur'],
      assistant_symptoms: json['assistant_symptoms'],
    );
  }

  final int? session_id;
  final DateTime? session_createdAt;
  final int? chat_id;
  final String? chat_type;
  final int? chat_user_id;
  final String? chat_user_profile_firstName;
  final String? chat_user_profile_lastName;
  final String? chat_user_profile_degree;
  final String? chat_user_profile_image_name;
  final String? chat_user_profile_image_blur;
  final String? chat_message;
  final DateTime? chat_message_createdAt;
  final String? chat_message_type;
  final int? chat_unread_messages_count;
  final bool? chat_closed;
  final DateTime? appointment_date;
  final DateTime? call_date;
  final int? assistant_id;
  final String? call_status;
  final String? call_user_profile_image_name;
  final String? call_user_profile_image_blur;
  final String? assistant_symptoms;
}
