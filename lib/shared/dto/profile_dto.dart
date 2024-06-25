import '../../home_screen/data/dto_home/news_response.dart';
import '../../profile/features/personal_info/features/my_physicians/features/physicians/data/physicians_dto.dart';
import '../widgets/logger.dart';
import 'driver_license_back_image_dto.dart';
import 'driver_license_front_image_dto.dart';
import 'insurance_back_image_dto.dart';
import 'insurance_front_image_dto.dart';
import 'user_dto.dart';

class ProfileResponseDto {
  ProfileResponseDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.preferredName,
    this.profileWasFilled,
    this.biologicalSex,
    this.dateOfBirth,
    this.chronicDiseasesAndAllergies,
    this.phone,
    this.pharmacyPhone,
    this.bio,
    this.medications,
    this.userId,
    this.imageId,
    this.driverLicenseFrontImageId,
    this.driverLicenseBackImageId,
    this.insuranceFrontImageId,
    this.insuranceBackImageId,
    this.creditCardNumber,
    this.qualification,
    this.lengthOfWork,
    this.streetAddress,
    this.streetAddress2,
    this.feedbackNotification,
    this.city,
    this.state,
    this.zipCode,
    this.pharmacyName,
    this.pharmacyAddress,
    this.tags,
    this.diagnosis,
    this.image,
    this.driverLicenseFrontImage,
    this.driverLicenseBackImage,
    this.insuranceFrontImage,
    this.insuranceBackImage,
    this.user,
    this.physicians,
    this.physiciansCount,
  });

  factory ProfileResponseDto.fromJson(dynamic json) {
    Log.w(json);
    return ProfileResponseDto(
      id: json['id'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      firstName: json['firstName'],
      lastName: json['lastName'],
      preferredName: json['preferredName'],
      profileWasFilled: json['profileWasFilled'],
      biologicalSex: json['biologicalSex'],
      dateOfBirth: DateTime.tryParse(json['dateOfBirth'] ?? ''),
      chronicDiseasesAndAllergies: json['chronicDiseasesAndAllergies'],
      phone: json['phone'],
      pharmacyPhone: json['pharmacyPhone'],
      bio: json['bio'],
      medications: json['medications'],
      userId: json['userId'],
      imageId: json['imageId'],
      driverLicenseFrontImageId: json['driverLicenseFrontImageId'],
      driverLicenseBackImageId: json['driverLicenseBackImageId'],
      insuranceFrontImageId: json['insuranceFrontImageId'],
      insuranceBackImageId: json['insuranceBackImageId'],
      creditCardNumber: json['creditCardNumber'],
      qualification: json['qualification'] != null
          ? QualificationDTO.fromJson(json['qualification'])
          : null,
      lengthOfWork:
          json['lengthOfWork'] != null ? '${json['lengthOfWork']}' : null,
      streetAddress: json['streetAddress'],
      streetAddress2: json['streetAddress2'],
      feedbackNotification: json['feedbackNotification'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      pharmacyName: json['pharmacyName'],
      pharmacyAddress: json['pharmacyAddress'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      diagnosis: json['diagnosis'] != null
          ? List<String>.from(json['diagnosis'])
          : null,
      image: json['image'] != null ? ImageDto.fromJson(json['image']) : null,
      user:
          json['user'] != null ? UserResponceDto.fromJson(json['user']) : null,
      physicians: json['physicians'] != null
          ? (json['physicians'] as List).map(PhysiciansDTO.fromJson).toList()
          : null,
      physiciansCount: json['physicians_count'],
    );
  }

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstName;
  final String? lastName;
  final String? preferredName;
  final bool? profileWasFilled;
  final String? biologicalSex;
  final DateTime? dateOfBirth;
  final String? chronicDiseasesAndAllergies;
  final String? phone;
  final String? pharmacyPhone;
  final String? bio;
  final String? medications;
  final int? userId;
  final int? imageId;
  final int? driverLicenseFrontImageId;
  final int? driverLicenseBackImageId;
  final int? insuranceFrontImageId;
  final int? insuranceBackImageId;
  final String? creditCardNumber;
  final QualificationDTO? qualification;
  final String? lengthOfWork;
  final String? streetAddress;
  final String? streetAddress2;
  final bool? feedbackNotification;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? pharmacyName;
  final String? pharmacyAddress;
  final List<String>? tags;
  final List<String>? diagnosis;
  final ImageDto? image;
  final DriverLicenseFrontImageDto? driverLicenseFrontImage;
  final DriverLicenseBackImageDto? driverLicenseBackImage;
  final InsuranceFrontImageDto? insuranceFrontImage;
  final InsuranceBackImageDto? insuranceBackImage;
  final UserResponceDto? user;
  final List<PhysiciansDTO>? physicians;
  final int? physiciansCount;
}

class QualificationDTO {
  QualificationDTO({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.order,
  });

  factory QualificationDTO.fromJson(dynamic json) {
    return QualificationDTO(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      order: json['order'],
    );
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? order;
}
