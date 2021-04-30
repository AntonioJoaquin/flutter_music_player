import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/ui/resources/index.dart';

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
        mainAxisSpacing: gridSpacing,
        crossAxisSpacing: gridSpacing
      ),
      itemCount: widget.albums.length,
      itemBuilder: (_, index) => 
        _buildItem(index) 
    );
  }

  Widget _buildItem(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(albumItemBorderRadius),
      child: GridTile(
        child: widget.albums[index].cover != null
          ? Image.memory(widget.albums[index].cover)
          : _buildImagePlaceholder(),
        footer: _buildFooter(index) // Text('${widget.albums[index].title}'),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Icon(
          FontAwesomeIcons.recordVinyl,
          size: albumItemPlaceholderIconSize,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFooter(int index) {
    return Visibility(
      visible: widget.albums[index].cover == null,
      child: Container(
        padding: const EdgeInsets.all(commonPadding),
        color: primaryColor.withOpacity(.5),
        child: Text(
          '${widget.albums[index].title}',
          overflow: TextOverflow.fade,
          softWrap: false,
          maxLines: 1,
          style: TextStyle(
            fontSize: albumItemFontSize,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}