class PhysicianPatchDTO {
  PhysicianPatchDTO({
    this.id,
    this.doctorFullName,
    this.phone,
    this.specialityId,
    this.profileId,
    this.ownerId,
    this.link,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorFullName': doctorFullName,
      'phone': phone,
      'specialityId': specialityId,
      'profileId': profileId,
      'ownerId': ownerId,
      'link': link,
    };
  }

  final int? id;
  final String? doctorFullName;
  final String? phone;
  final int? specialityId;
  final int? profileId;
  final int? ownerId;
  final String? link;
}
