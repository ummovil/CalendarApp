import '/components/main_web_nav_widget.dart';
import '/components/mobile_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagos_model.dart';
export 'pagos_model.dart';

class PagosWidget extends StatefulWidget {
  const PagosWidget({Key? key}) : super(key: key);

  @override
  _PagosWidgetState createState() => _PagosWidgetState();
}

class _PagosWidgetState extends State<PagosWidget> {
  late PagosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            wrapWithModel(
              model: _model.mainWebNavModel,
              updateCallback: () => setState(() {}),
              child: MainWebNavWidget(
                navOne: FlutterFlowTheme.of(context).alternate,
                navTwo: FlutterFlowTheme.of(context).secondaryText,
                navThree: FlutterFlowTheme.of(context).secondaryText,
                navFour: FlutterFlowTheme.of(context).secondaryText,
                navFive: FlutterFlowTheme.of(context).secondaryText,
                navSix: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Aqui estará el contenido de la agendaUM
                            FlutterFlowWebView(
                              content: 'https://www.um.edu.mx/pagos/',
                              bypass: false,
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              verticalScroll: false,
                              horizontalScroll: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.mobileNavModel,
                  updateCallback: () => setState(() {}),
                  child: MobileNavWidget(
                    navOneIcon: Icon(
                      Icons.home_rounded,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    navTwoIcon: Icon(
                      Icons.grain,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    navThreeIcon: Icon(
                      Icons.credit_card_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    navFourIcon: Icon(
                      Icons.group_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    navFiveIcon: Icon(
                      Icons.home_work_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
