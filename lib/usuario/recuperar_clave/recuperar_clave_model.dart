import '/flutter_flow/flutter_flow_util.dart';
import 'recuperar_clave_widget.dart' show RecuperarClaveWidget;
import 'package:flutter/material.dart';

class RecuperarClaveModel extends FlutterFlowModel<RecuperarClaveWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();
  }
}
