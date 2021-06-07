import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/arguments/album_argument.dart';

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
          child: Hero(
            tag: album.id,
            child: (album.cover != null)
              ? album.cover.isNotEmpty
                ? Image.memory(album.cover)
                : _buildCoverPlaceholder(album.title)
              : (album.albumArt != null)
                ? Image.file(File(album.albumArt))
                : _buildCoverPlaceholder(album.title)
          ),
        ),
      ),
    );
  }

  Widget _buildCoverPlaceholder(String title) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Functions
  void _onItemTapped(Album album) {
    Get.toNamed('/album', arguments: AlbumArguments(
      albumId: album.id,
      albumTitle: album.title,
      albumCover: album.cover
    ));
  }
}