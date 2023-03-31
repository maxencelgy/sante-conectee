import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class Music {
  final String title;
  final String category;
  final String time;
  final String image;

  Music({required this.title, required this.category, required this.time, required this.image});
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController _searchController;
  List<Music> _musicList = [
    Music(title: 'Abdominale', category: 'Stress', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990764483416134/moutains.png'),
    Music(title: 'Carré', category: 'Concentration', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990764835741746/stars.png'),
    Music(title: 'Alternance des narines', category: 'Esprit', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990765154517012/sunset.png'),
    Music(title: 'Cohérence cardiaque', category: 'Santé', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990765481660526/aurora.png'),
    Music(title: 'Gratitude', category: 'Bien-être', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990765917872158/canyon.png'),
    Music(title: 'Progression', category: 'Insomnie', time: '10 min', image: 'https://cdn.discordapp.com/attachments/1060842126352597062/1090990764118524026/firecampforest.png'),
  ];
  List<Music> _filteredMusicList = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredMusicList = _musicList;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterMusicList(String searchText) {
    setState(() {
      _filteredMusicList = _musicList.where((music) =>
      music.title.toLowerCase().contains(searchText.toLowerCase()) ||
          music.category.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF122944),
      appBar: AppBar(
        backgroundColor: Color(0xFF122944),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Rechercher',
            border: InputBorder.none,
          ),
          onChanged: (value) => _filterMusicList(value),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredMusicList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      _filteredMusicList[index].image,
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                          _filteredMusicList[index].title,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Fira Sans Condensed',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Text(
                        _filteredMusicList[index].category,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Fira Sans Condensed',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: _filteredMusicList[index].time,
                            options: FFButtonOptions(
                              width: 65.0,
                              height: 20.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF122944),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Fira Sans Condensed',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
