import 'package:flutter/widgets.dart';

import 'listeners/auth_listener.dart';
import 'listeners/root_gateway_listener.dart';

class CoreOrchestrator extends StatefulWidget {
  const CoreOrchestrator({required this.builder, super.key});

  final Widget Function(BuildContext) builder;

  @override
  State<CoreOrchestrator> createState() => _CoreOrchestratorState();
}

class _CoreOrchestratorState extends State<CoreOrchestrator> {
  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: RootGatewayListener(
        child: Builder(
          builder: widget.builder,
        ),
      ),
    );
  }
}
