import '../../../../../shared/data/root_gateway/root_gateway.dart';

class StatesApi {
  StatesApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<String>?> fetchStatesUs() async {
    final reponse = await api.gateway.general.get('/profiles/states');

    return reponse.data != null ? (reponse.data as List).cast<String>() : null;
  }
}
