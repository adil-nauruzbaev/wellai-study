import '../../../../../shared/data/root_gateway/root_gateway.dart';
import '../../../../../shared/widgets/logger.dart';
import '../dto/patch_info_dto.dart';
import '../dto/profile_info_dto.dart';

class ProfileInfoApi {
  ProfileInfoApi({required this.api});

  final RootGateway api;

  Future<ProfileInfoDTO> getProgileInfos() async {
    final response = await api.gateway.general.get(
      '/auth/my?include=confirm,cabinets,cabinets.contacts,roles,profile,profile.image,invites.role,profile.driverLicenseFrontImage,profile.driverLicenseBackImage,profile.insuranceFrontImage,profile.insuranceBackImage',
    );

    Log.r(response.verbose);

    return ProfileInfoDTO.fromJson(response.data);
  }

  Future<void> patchProileInfo(
    PatchInfoDTO patchInfoDTO,
    int id,
  ) async {
    final jsonData = patchInfoDTO.toJson();
    await api.gateway.general.patch(
      '/profiles/$id',
      data: jsonData,
    );
  }
}
