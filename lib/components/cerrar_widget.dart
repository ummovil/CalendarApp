import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cerrar_model.dart';
export 'cerrar_model.dart';

class CerrarWidget extends StatefulWidget {
  const CerrarWidget({Key? key}) : super(key: key);

  @override
  _CerrarWidgetState createState() => _CerrarWidgetState();
}

class _CerrarWidgetState extends State<CerrarWidget> {
  late CerrarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CerrarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
      child: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30.0,
        buttonSize: 48.0,
        icon: Icon(
          Icons.close_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 30.0,
        ),
        onPressed: () async {
          Navigator.pop(context);
        },
      ),
    );
  }
}
