import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/arguments/album_argument.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/ui/resources/index.dart';
import 'package:get/get.dart';

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
        _buildItem(widget.albums[index]) 
    );
  }

  Widget _buildItem(Album album) {
    return InkWell(
      onTap: () => _onItemTapped(album),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(albumItemBorderRadius),
        child: GridTile(
          child: album.cover != null
            ? Hero(
                tag: album.id,
                child: Image.memory(album.cover)
              )
            : _buildImagePlaceholder(),
          footer: _buildFooter(album) // Text('${widget.albums[index].title}'),
        ),
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

  Widget _buildFooter(Album album) {
    return Visibility(
      visible: album.cover == null,
      child: Container(
        padding: const EdgeInsets.all(commonPadding),
        color: primaryColor.withOpacity(.5),
        child: Text(
          '${album.title}',
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

  // Functions
  void _onItemTapped(Album album) {
    Get.toNamed('/album', arguments: AlbumArguments(
      albumId: album.id,
      albumCover: album.cover
    ));
  }
}