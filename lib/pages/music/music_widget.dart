import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'music_model.dart';
export 'music_model.dart';

class MusicWidget extends StatefulWidget {
  const MusicWidget({Key? key}) : super(key: key);

  @override
  _MusicWidgetState createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  late MusicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicModel());
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
      backgroundColor: Color(0xFF1E3756),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Mistifux_peaceful_flat_color_mountains--v_4_4cbed5c1-7ef0-41da-8136-bcc73f73940d_3_(3).png',
                      ).image,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0x34000000),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 300),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                            'Home',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                              TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                PageTransitionType.fade,
                                                duration:
                                                Duration(milliseconds: 400),
                                              ),
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Down the river',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Fira Sans Condensed',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 48,
                                    ),
                                  ),
                                  Text(
                                    'Sleep track',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Fira Sans Condensed',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.replay_10,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 50,
                                      ),
                                      Icon(
                                        Icons.pause_circle_filled_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 100,
                                      ),
                                      Icon(
                                        Icons.forward_10,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowAudioPlayer(
                                        audio: Audio.network(
                                          'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                                          metas: Metas(
                                            id: 'sample3.mp3-wqth51ww',
                                            title: 'Down the river',
                                          ),
                                        ),
                                        titleTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily:
                                          'Fira Sans Condensed',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF9D9D9D),
                                          fontSize: 12,
                                        ),
                                        fillColor: Color(0x01FFFFFF),
                                        playbackButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .tertiary400,
                                        activeTrackColor: Color(0xFF57636C),
                                        elevation: 4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
