import '/calendario/calendario_widget.dart';
import '/components/main_web_nav_widget.dart';
import '/components/mobile_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/formulario/formulario_widget.dart';
import '/login/login_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  Local state fields for this page.

  String daySelected = '';

  bool visibility = false;

  ///  State fields for stateful widgets in this page.

  // Model for mainWebNav component.
  late MainWebNavModel mainWebNavModel;
  // Model for mobileNav component.
  late MobileNavModel mobileNavModel;
  var codigoqr = '';

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
