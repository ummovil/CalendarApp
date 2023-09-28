import '/components/main_web_nav_widget.dart';
import '/components/mobile_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagos_widget.dart' show PagosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PagosModel extends FlutterFlowModel<PagosWidget> {
  ///  Local state fields for this page.

  String daySelected = '';

  bool visibility = false;

  ///  State fields for stateful widgets in this page.

  // Model for mainWebNav component.
  late MainWebNavModel mainWebNavModel;
  // Model for mobileNav component.
  late MobileNavModel mobileNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainWebNavModel = createModel(context, () => MainWebNavModel());
    mobileNavModel = createModel(context, () => MobileNavModel());
  }

  void dispose() {
    mainWebNavModel.dispose();
    mobileNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
