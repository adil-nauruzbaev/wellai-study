class PostDocumentsDto {
  PostDocumentsDto({
    this.hader,
    this.categoryId,
    this.dateOfEvent,
    this.byClinic = false,
    this.userId = 1266,
    this.file,
  });

  Map<String, dynamic> toJson() {
    return {
      'hader': hader,
      'categoryId': categoryId,
      'dateOfEvent': dateOfEvent,
      'byClinic': byClinic,
      'userId': userId,
      'file': file,
    };
  }

  final String? hader;
  final int? categoryId;
  final DateTime? dateOfEvent;
  final bool byClinic;
  final int userId;
  final String? file;
}
