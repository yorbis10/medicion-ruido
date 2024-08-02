import '/flutter_flow/flutter_flow_util.dart';
import 'dash1_widget.dart' show Dash1Widget;
import 'package:flutter/material.dart';

class Dash1Model extends FlutterFlowModel<Dash1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
