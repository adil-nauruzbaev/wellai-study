import '../../add_physician/data/dto/qualifification_dto.dart';

class PhysiciansDTO {
  PhysiciansDTO({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.doctorFullName,
    this.phone,
    this.specialityId,
    this.profileId,
    this.ownerId,
    this.link,
    this.speciality,
    // this.histories,
  });

  factory PhysiciansDTO.fromJson(dynamic json) {
    return PhysiciansDTO(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      doctorFullName: json['doctorFullName'],
      phone: json['phone'],
      specialityId: json['specialityId'],
      profileId: json['profileId'],
      ownerId: json['ownerId'],
      link: json['link'],
      speciality: json['speciality'] != null ? QualifificationDTO.fromJson(json['speciality']) : null,
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? doctorFullName;
  final String? phone;
  final int? specialityId;
  final int? profileId;
  final int? ownerId;
  final String? link;
  final QualifificationDTO? speciality;
  //final histories;
}
 

//  class HistoriesDTO{
//   "histories": [
//  {
//  "id": 121,
// "createdAt": "2024-01-29T07:47:32.793Z",
// "updatedAt": "2024-01-29T07:47:32.793Z",
//  "type": "create",
//  "userId": 167,
//  "documentId": null,
// "physicianId": 102
// }
// ]
//  }