import '../../../../../shared/data/root_gateway/root_gateway.dart';

class PharmacyApi {
  PharmacyApi({
    required this.api,
  });

  final RootGateway api;

  Future<List<String>?> fetchPharmacies() async {
    final reponse = await api.gateway.general.get('/profiles/pharmacies');

    return reponse.data != null ? (reponse.data as List).cast<String>() : null;
  }
}
