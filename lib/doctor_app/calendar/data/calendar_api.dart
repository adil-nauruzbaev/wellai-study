import '../../../shared/data/root_gateway/root_gateway.dart';
import 'dto/work_time.dart';

class CalendarDocApi {
  CalendarDocApi({required this.api});
  final RootGateway api;
  Future<List<WorkTime>> getWorks(String start, String end) async {
    final response = await api.gateway.general.post(
      '/work/busy',
      data: {
        'start': start,
        'end': end,
      },
    );
    final results = <WorkTime>[];
    for (final element in response.data['worktime']) {
      results.add(WorkTime.fromJson(element));
    }

    return results;
  }
}
