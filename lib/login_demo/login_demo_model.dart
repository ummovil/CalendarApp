import '/backend/api_requests/api_calls.dart';
import '/components/recupera_password_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/home_page_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginDemoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for userAddress_Login widget.
  TextEditingController? userAddressLoginController;
  final userAddressLoginMask = MaskTextInputFormatter(mask: '#######');
  String? Function(BuildContext, String?)? userAddressLoginControllerValidator;
  // State field(s) for password_Login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  // Stores action output result for [Backend Call - API (log)] action in Button-Login widget.
  ApiCallResponse? apiLogResponse;
  // State field(s) for matriculaRegis widget.
  TextEditingController? matriculaRegisController;
  final matriculaRegisMask = MaskTextInputFormatter(mask: '#######');
  String? Function(BuildContext, String?)? matriculaRegisControllerValidator;
  // State field(s) for passwordRegis widget.
  TextEditingController? passwordRegisController;
  late bool passwordRegisVisibility;
  String? Function(BuildContext, String?)? passwordRegisControllerValidator;
  // State field(s) for passwordConfirmRegis widget.
  TextEditingController? passwordConfirmRegisController;
  late bool passwordConfirmRegisVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmRegisControllerValidator;
  // Stores action output result for [Backend Call - API (selfRegistration)] action in Button widget.
  ApiCallResponse? apiResult784;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    passwordRegisVisibility = false;
    passwordConfirmRegisVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    userAddressLoginController?.dispose();
    passwordLoginController?.dispose();
    matriculaRegisController?.dispose();
    passwordRegisController?.dispose();
    passwordConfirmRegisController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
