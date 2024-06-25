import 'package:flutter_bloc/flutter_bloc.dart';

import 'gateway/gateway.dart';
import 'gateway/i_gateway.dart';
import 'gateway/states.dart';
import 'i_root_gateway.dart';

export 'i_root_gateway.dart';

class RootGateway extends Cubit<RootGatewayState> implements IRootGateway {
  RootGateway() : super(RootGatewayState()) {
    _updateGetways();
  }

  bool _isProduction = false;
  late Gateway _prod;
  late Gateway _test;
  String _token = '';

  @override
  IGateway get gateway => _isProduction ? _prod : _test;

  @override
  set isProduction(bool? value) {
    if (value == null) return;
    _isProduction = value;
    _updateGetways();
  }

  @override
  set localeCode(String? value) {
    if (value == null) return;
    _updateGetways();
  }

  @override
  set token(String? value) {
    if (value == null) return;
    _token = value;
    _updateGetways();
  }

  void _updateGetways() {
    _prod = Gateway(
      token: _token,
      uriGeneral: Uri(scheme: 'https', host: 'test.wellai.health', path: '/awsapi/'),
      onAuthError: (error) {
        emit(RootGatewayState(authError: error));
        emit(RootGatewayState());
      },
    );
    _test = Gateway(
      token: _token,
      uriGeneral: Uri(scheme: 'https', host: 'test.wellai.health', path: '/awsapi/'),
      onAuthError: (error) {
        emit(RootGatewayState(authError: error));
        emit(RootGatewayState());
      },
    );
  }
}
