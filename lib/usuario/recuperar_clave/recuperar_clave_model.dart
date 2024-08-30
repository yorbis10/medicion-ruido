import '/flutter_flow/flutter_flow_util.dart';
import 'recuperar_clave_widget.dart' show RecuperarClaveWidget;
import 'package:flutter/material.dart';

class RecuperarClaveModel extends FlutterFlowModel<RecuperarClaveWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qn2hepbo' /* El correo es obligatorio  Ej. ... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'y1kcrio3' /* Cantidad de caracteres  del co... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'b9kvmb9g' /* El formato del correo no es va... */,
      );
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    correoTextControllerValidator = _correoTextControllerValidator;
  }

  @override
  void dispose() {
    correoFocusNode?.dispose();
    correoTextController?.dispose();
  }
}
