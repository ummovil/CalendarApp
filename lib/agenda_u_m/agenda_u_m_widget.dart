import '/components/main_web_nav_widget.dart';
import '/components/mobile_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/formulario/formulario_widget.dart';
import '/home_page/home_page_widget.dart';
import '/tess_a_p_i/tess_a_p_i_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agenda_u_m_model.dart';
export 'agenda_u_m_model.dart';

class AgendaUMWidget extends StatefulWidget {
  const AgendaUMWidget({Key? key}) : super(key: key);

  @override
  _AgendaUMWidgetState createState() => _AgendaUMWidgetState();
}

class _AgendaUMWidgetState extends State<AgendaUMWidget> {
  late AgendaUMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaUMModel());
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TessAPIWidget(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/short_logo.svg',
                width: 52.0,
                height: 37.0,
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.codigoqr = await FlutterBarcodeScanner.scanBarcode(
                  '#C62828', // scanning line color
                  'Cancel', // cancel button text
                  true, // whether to show the flash icon
                  ScanMode.QR,
                );

                if (_model.codigoqr == '-1') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageWidget(),
                    ),
                  );
                } else if (Uri.parse(_model.codigoqr!).isAbsolute) {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('QR Inválido'),
                        content: Text(
                            'Escanea nuevamente para obtener un código válido.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioWidget(
                        codigoqr: _model.codigoqr,
                      ),
                    ),
                  );
                }

                setState(() {});
              },
              child: Icon(
                Icons.assignment,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
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
                            FlutterFlowWebView(
                              content: 'https://um.edu.mx/agenda',
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
