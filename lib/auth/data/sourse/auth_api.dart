import '../../../shared/data/root_gateway/root_gateway.dart';
import '../dto/auth_response.dart';

class AuthApi {
  AuthApi({
    required this.api,
  });

  final RootGateway api;

  Future<AuthResponseDto> signIn(
    String login,
    String pass,
    bool isDoctor,
  ) async {
    final response = await api.gateway.general.post(
      '/auth/login',
      data: {
        'email': login,
        'password': pass,
        'appType': isDoctor ? 'doctor' : 'patient',
      },
    );
    return AuthResponseDto.fromJson(response.data);
  }
}
