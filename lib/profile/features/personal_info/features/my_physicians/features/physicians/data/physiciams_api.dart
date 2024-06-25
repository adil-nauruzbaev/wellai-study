import '../../../../../../../../shared/data/root_gateway/root_gateway.dart';
import 'physician_patch_dto.dart';
import 'physicians_dto.dart';

class PhysiciansApi {
  PhysiciansApi({
    required this.api,
  });
  final RootGateway api;

  Future<List<PhysiciansDTO>> getPhysicians() async {
    final response = await api.gateway.general.get(
      '/physicians?include=speciality',
    );

    final data = <PhysiciansDTO>[];

    for (final element in response.data['physician']) {
      data.add(PhysiciansDTO.fromJson(element));
    }

    return data;
  }

  Future<void> patchPhysicians(
    PhysicianPatchDTO patchPhysDTO,
    int id,
  ) async {
    final jsonData = patchPhysDTO.toJson();
    await api.gateway.general.patch(
      '/physicians/$id',
      data: jsonData,
    );
  }

  Future<void> deletePysician(int id) async {
    await api.gateway.general.delete('/physicians/$id');
  }
}
