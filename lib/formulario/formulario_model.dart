import '/backend/api_requests/api_calls.dart';
import '/components/cerrar_widget.dart';
import '/components/rating_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormularioModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? num;

  int? index;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for cerrar component.
  late CerrarModel cerrarModel;
  // Models for ratingBar dynamic component.
  late FlutterFlowDynamicModels<RatingBarModel> ratingBarModels;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (RespuestaApi)] action in Button widget.
  ApiCallResponse? apiResult6bp;
  // Stores action output result for [Backend Call - API (RespuestaApi)] action in Button widget.
  ApiCallResponse? apiResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cerrarModel = createModel(context, () => CerrarModel());
    ratingBarModels = FlutterFlowDynamicModels(() => RatingBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cerrarModel.dispose();
    ratingBarModels.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
