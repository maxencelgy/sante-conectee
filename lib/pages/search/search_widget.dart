import 'package:flutter/material.dart';

class Music {
  final String title;
  final String artist;
  final String album;

  Music({required this.title, required this.artist, required this.album});
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController _searchController;
  List<Music> _musicList = [
    Music(title: 'Believer', artist: 'Imagine Dragons', album: 'Evolve'),
    Music(title: 'Bad Guy', artist: 'Billie Eilish', album: 'When We All Fall Asleep, Where Do We Go?'),
    Music(title: 'All of Me', artist: 'John Legend', album: 'Love in the Future'),
    Music(title: 'Shape of You', artist: 'Ed Sheeran', album: '÷'),
    Music(title: 'Uptown Funk', artist: 'Mark Ronson ft. Bruno Mars', album: 'Uptown Special'),
    Music(title: 'Counting Stars', artist: 'OneRepublic', album: 'Native'),
    Music(title: 'Roar', artist: 'Katy Perry', album: 'Prism'),
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
          music.artist.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (value) => _filterMusicList(value),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredMusicList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredMusicList[index].title),
            subtitle: Text('${_filteredMusicList[index].artist} - ${_filteredMusicList[index].album}'),
          );
        },
      ),
    );
  }
}
