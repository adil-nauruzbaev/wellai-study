import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/root_gateway/gateway/states.dart';
import '../../../data/root_gateway/root_gateway.dart';
import '../../../widgets/logger.dart';
import '../../core_d_i.dart';

class RootGatewayListener extends StatelessWidget {
  const RootGatewayListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RootGateway, RootGatewayState>(
      bloc: CoreDi.get<RootGateway>(),
      listener: (context, state) {
        if (state.authError != null) {
          Log.error(state.authError);
        }
      },
      child: child,
    );
  }
}
