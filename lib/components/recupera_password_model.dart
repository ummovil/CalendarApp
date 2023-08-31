import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecuperaPasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for matricula widget.
  TextEditingController? matriculaController;
  String? Function(BuildContext, String?)? matriculaControllerValidator;
  // Stores action output result for [Backend Call - API (recoveryPassword)] action in recuperar widget.
  ApiCallResponse? apiResultrqs;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    matriculaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
