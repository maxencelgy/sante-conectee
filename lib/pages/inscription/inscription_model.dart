import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InscriptionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Password widget.
  TextEditingController? passwordController1;
  String? Function(BuildContext, String?)? passwordController1Validator;
  // State field(s) for Password widget.
  TextEditingController? passwordController2;
  String? Function(BuildContext, String?)? passwordController2Validator;
  // State field(s) for Password widget.
  TextEditingController? passwordController3;
  String? Function(BuildContext, String?)? passwordController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailController?.dispose();
    passwordController1?.dispose();
    passwordController2?.dispose();
    passwordController3?.dispose();
  }

  /// Additional helper methods are added here.

}
