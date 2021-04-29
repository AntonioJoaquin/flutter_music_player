import 'package:flutter/material.dart';
import 'package:flutter_music_player/domain/entity/album.dart';

class MediaGrid extends StatefulWidget {
  final List<Album> albums;

  MediaGrid({
    Key key,
    this.albums
  }) : super(key: key);

  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  @override
  Widget build(BuildContext context) {
    return widget.albums.isEmpty
      ? _buildEmptyView()
      : _buildGrid();
  }

  Widget _buildEmptyView() {
    return Center(child: Text('No albums founded'),);
  }

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0
      ),
      itemCount: widget.albums.length,
      itemBuilder: (_, index) => 
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GridTile(
            child: widget.albums[index].cover != null
              ? Image.memory(widget.albums[index].cover)
              : Container(
                color: Colors.grey,
                child: Center(
                  child: Icon(
                    Icons.album_rounded,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
              ),
            footer: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.black54,
              child: Text(
                '${widget.albums[index].title}',
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white
                ),
              ),
            ) // Text('${widget.albums[index].title}'),
          ),
        ) 
    );
  }
}