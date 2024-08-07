import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  // State field(s) for clave widget.
  FocusNode? claveFocusNode;
  TextEditingController? claveTextController;
  late bool claveVisibility;
  String? Function(BuildContext, String?)? claveTextControllerValidator;

  @override
  void initState(BuildContext context) {
    claveVisibility = false;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();

    claveFocusNode?.dispose();
    claveTextController?.dispose();
  }
}
