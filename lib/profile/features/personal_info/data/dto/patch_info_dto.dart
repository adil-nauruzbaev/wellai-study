class PatchInfoDTO {
  PatchInfoDTO({
    this.image,
    this.insuranceBackImage,
    this.insuranceFrontImage,
    this.userId,
    this.driverLicenseFrontImageId,
    this.insuranceFrontImageId,
    this.insuranceBackImageId,
    this.firstName,
    this.lastName,
    this.preferredName,
    this.biologicalSex,
    this.dateOfBirth,
    this.chronicDiseasesAndAllergies,
    this.phone,
    this.pharmacyPhone,
    this.qualification,
    this.lengthOfWork,
    this.creditCardNumber,
    this.profileWasFilled,
    this.streetAddress,
    this.streetAddress2,
    this.city,
    this.state,
    this.zipCode,
    this.pharmacyName,
    this.pharmacyAddress,
    this.bio,
    this.medications,
    this.tags,
    this.diagnosis,
    this.id,
    this.driverLicenseFrontImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'driverLicenseFrontImage': driverLicenseFrontImage,
      'insuranceBackImage': insuranceBackImage,
      'insuranceFrontImage': insuranceFrontImage,
      'image': image,
      'firstName': firstName,
      'lastName': lastName,
      'preferredName': preferredName,
      'biologicalSex': biologicalSex,
      'dateOfBirth': dateOfBirth,
      'chronicDiseasesAndAllergies': chronicDiseasesAndAllergies,
      'phone': phone,
      'pharmacyPhone': pharmacyPhone,
      'qualification': qualification,
      'lengthOfWork': lengthOfWork,
      'creditCardNumber': creditCardNumber,
      'profileWasFilled': profileWasFilled,
      'streetAddress': streetAddress,
      'streetAddress2': streetAddress2,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'pharmacyName': pharmacyName,
      'pharmacyAddress': pharmacyAddress,
      'bio': bio,
      'medications': medications,
      'tags': tags,
      'diagnosis': diagnosis,
      'id': id,
    };
  }

  final String? driverLicenseFrontImage;
  final String? insuranceBackImage;
  final String? insuranceFrontImage;
  final String? image;
  final int? userId;
  final int? driverLicenseFrontImageId;
  final int? insuranceFrontImageId;
  final int? insuranceBackImageId;
  final String? firstName;
  final String? lastName;
  final String? preferredName;
  final String? biologicalSex;
  final DateTime? dateOfBirth;
  final String? chronicDiseasesAndAllergies;
  final String? phone;
  final String? pharmacyPhone;
  final String? qualification;
  final int? lengthOfWork;
  final String? creditCardNumber;
  final bool? profileWasFilled;
  final String? streetAddress;
  final String? streetAddress2;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? pharmacyName;
  final String? pharmacyAddress;
  final String? bio;
  final String? medications;
  final List<String>? tags;
  final List<String>? diagnosis;
  final int? id;
}
