import '/flutter_flow/flutter_flow_util.dart';
import 'cambiar_clave_widget.dart' show CambiarClaveWidget;
import 'package:flutter/material.dart';

class CambiarClaveModel extends FlutterFlowModel<CambiarClaveWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for claveActual widget.
  FocusNode? claveActualFocusNode;
  TextEditingController? claveActualTextController;
  late bool claveActualVisibility;
  String? Function(BuildContext, String?)? claveActualTextControllerValidator;
  // State field(s) for nuevaClave widget.
  FocusNode? nuevaClaveFocusNode;
  TextEditingController? nuevaClaveTextController;
  late bool nuevaClaveVisibility;
  String? Function(BuildContext, String?)? nuevaClaveTextControllerValidator;
  // State field(s) for confirmaClave widget.
  FocusNode? confirmaClaveFocusNode;
  TextEditingController? confirmaClaveTextController;
  late bool confirmaClaveVisibility;
  String? Function(BuildContext, String?)? confirmaClaveTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;

  @override
  void initState(BuildContext context) {
    claveActualVisibility = false;
    nuevaClaveVisibility = false;
    confirmaClaveVisibility = false;
  }

  @override
  void dispose() {
    claveActualFocusNode?.dispose();
    claveActualTextController?.dispose();

    nuevaClaveFocusNode?.dispose();
    nuevaClaveTextController?.dispose();

    confirmaClaveFocusNode?.dispose();
    confirmaClaveTextController?.dispose();
  }
}
