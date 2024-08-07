import '/flutter_flow/flutter_flow_util.dart';
import 'administrar_usuarios_widget.dart' show AdministrarUsuariosWidget;
import 'package:flutter/material.dart';

class AdministrarUsuariosModel
    extends FlutterFlowModel<AdministrarUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
