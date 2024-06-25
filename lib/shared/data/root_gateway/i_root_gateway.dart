import 'package:flutter_bloc/flutter_bloc.dart';

import 'gateway/i_gateway.dart';
import 'gateway/states.dart';

abstract class IRootGateway implements StateStreamable<RootGatewayState> {
  IGateway get gateway;

  set isProduction(bool? value);

  set localeCode(String? value);

  set token(String? value);
}
