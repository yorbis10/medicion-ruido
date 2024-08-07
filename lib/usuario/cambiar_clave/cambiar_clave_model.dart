import '/flutter_flow/flutter_flow_util.dart';
import 'cambiar_clave_widget.dart' show CambiarClaveWidget;
import 'package:flutter/material.dart';

class CambiarClaveModel extends FlutterFlowModel<CambiarClaveWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for claveActual widget.
  FocusNode? claveActualFocusNode;
  TextEditingController? claveActualTextController;
  String? Function(BuildContext, String?)? claveActualTextControllerValidator;
  // State field(s) for nuevaClave widget.
  FocusNode? nuevaClaveFocusNode;
  TextEditingController? nuevaClaveTextController;
  String? Function(BuildContext, String?)? nuevaClaveTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    claveActualFocusNode?.dispose();
    claveActualTextController?.dispose();

    nuevaClaveFocusNode?.dispose();
    nuevaClaveTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
