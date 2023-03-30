import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'music_model.dart';
export 'music_model.dart';

class MusicWidget extends StatefulWidget {
  final String musicId;
  final String urlImg;
  final String url;
  final String category;
  final String title;
  const MusicWidget({Key? key, required this.musicId, required this.category, required this.urlImg, required this.url, required this.title}) : super(key: key);

  @override
  _MusicWidgetState createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  late MusicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api-node-breathe.hop.sh/api/sounds/63eb8fab9c49436c3065188f'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      debugPrint(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicModel());

    // Appel de l'API

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
            child: SingleChildScrollView(
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
                        image: Image.network(
                            '${this.widget.urlImg}',
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.95, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 300),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                                    duration: Duration(
                                                        milliseconds: 400),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 150),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${this.widget.title}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Fira Sans Condensed',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 48,
                                        ),
                                      ),
                                      Text(
                                        '${this.widget.category}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Fira Sans Condensed',
                                          color:
                                          FlutterFlowTheme.of(context)
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 70),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowAudioPlayer(
                                              audio: Audio.network(
                                                '${this.widget.url}',
                                                metas: Metas(
                                                  id: 'sample3.mp3-tz0gd8fs',
                                                  title: '${this.widget.title}',
                                                ),
                                              ),
                                              titleTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily:
                                                'Fira Sans Condensed',
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.w600,
                                              ),
                                              playbackDurationTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF9D9D9D),
                                                fontSize: 12,
                                              ),
                                              fillColor: Color(0x01FFFFFF),
                                              playbackButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary400,
                                              activeTrackColor:
                                              Color(0xFF57636C),
                                              elevation: 4,
                                            ),
                                          ],
                                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
