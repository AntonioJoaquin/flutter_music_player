import 'package:flutter/material.dart';

import 'package:flutter_music_player/domain/entity/song.dart';

class MediaList extends StatefulWidget {
  final List<Song> songs;
  
  MediaList({
    Key key,
    this.songs
  }) : super(key: key);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  @override
  Widget build(BuildContext context) {
    return widget.songs.isEmpty
      ? Center(child: Text('No albums founded'),)
      : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.songs.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                widget.songs[index].title,
              ),
            );
          }
        );
  }
}