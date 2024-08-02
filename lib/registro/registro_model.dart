import '/flutter_flow/flutter_flow_util.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for clave widget.
  FocusNode? claveFocusNode;
  TextEditingController? claveTextController;
  late bool claveVisibility;
  String? Function(BuildContext, String?)? claveTextControllerValidator;
  // State field(s) for confirmaclave widget.
  FocusNode? confirmaclaveFocusNode;
  TextEditingController? confirmaclaveTextController;
  late bool confirmaclaveVisibility;
  String? Function(BuildContext, String?)? confirmaclaveTextControllerValidator;

  @override
  void initState(BuildContext context) {
    claveVisibility = false;
    confirmaclaveVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    claveFocusNode?.dispose();
    claveTextController?.dispose();

    confirmaclaveFocusNode?.dispose();
    confirmaclaveTextController?.dispose();
  }
}
