import '../../shared/data/root_gateway/root_gateway.dart';
import '../../shared/widgets/logger.dart';
import 'work_th_dto.dart';

class WorkThApi {
  WorkThApi({
    required this.api,
  });
  final RootGateway api;

  Future<WorkThDTO> postWork(
    String start,
    String end,
  ) async {
    final response = await api.gateway.general.post(
      'work/freedom',
      data: {
        'start': start,
        'end': end,
      },
    );

    Log.w(response.verbose);
    return WorkThDTO.fromJson(response.data);
  }
}
