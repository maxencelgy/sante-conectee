import 'package:breath_meditation/index.dart';
import 'package:flutter/gestures.dart';

import '../inscription_page.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'intro_model.dart';
export 'intro_model.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  late IntroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF122944),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              margin: EdgeInsets.all(30),
            child :Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Image.asset(
                    'assets/images/logobreathe.png',
                    width: 500.0,
                    height: 360.2,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'BREATH',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Fira Sans Condensed',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Méditation',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Fira Sans Condensed',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "FiraSansCondensed"),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color(0xFF0FD0DA)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnexionPage()),
                      );
                    }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Vous n\'avez pas de compte? ',
                            style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'S\'inscrire',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InscriptionPage()),
                                );
                              })
                      ])),
                )
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
