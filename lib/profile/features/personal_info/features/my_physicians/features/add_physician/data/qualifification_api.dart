import '../../../../../../../../shared/data/root_gateway/root_gateway.dart';
import 'dto/qualifification_dto.dart';

class QualifificationApi {
  QualifificationApi({
    required this.api,
  });
  final RootGateway api;

  Future<List<QualifificationDTO>> getQualiffications() async {
    final response = await api.gateway.general.get(
      '/specialties',
    );

    final data = <QualifificationDTO>[];

    for (final element in response.data['specialties']) {
      data.add(QualifificationDTO.fromJson(element));
    }

    return data;
  }
}
