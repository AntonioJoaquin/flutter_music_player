import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/arguments/album_argument.dart';
import 'package:flutter_music_player/ui/resources/index.dart';
import 'package:flutter_music_player/ui/widgets/blur_cover_widget.dart';

import 'package:get/get.dart';

import 'package:flutter_music_player/domain/controller/album_controller.dart';
import 'package:flutter_music_player/ui/widgets/media_list_widget.dart';

class AlbumPage extends GetView<AlbumController> {
  final String id = (Get.arguments as AlbumArguments).albumId;
  final String title = (Get.arguments as AlbumArguments).albumTitle;
  final Uint8List albumCover = (Get.arguments as AlbumArguments).albumCover;
  final String albumArt = (Get.arguments as AlbumArguments).albumArt;

  AlbumPage({Key key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    controller.getAlbumsSongs(id);
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlurCover(
              albumCover: albumCover,
              albumArt: albumArt,
            ),
            _buildBody(),
          ],
        )
      ),
    );
  }

   Widget _buildBody() {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: GetBuilder<AlbumController>(
              builder: (controller) {
                return controller.isLoading
                  ? Center(child: CircularProgressIndicator(),)
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MediaList(songs: controller.songs,),
                  );
              },
            ),
          ),
        ),
      ],
    );
   }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(.5)
      ),
      child: Row(
        children: [
          _buildCover(),
          SizedBox(width: 24.0,),
          Flexible(
            child: Text(title),
          )
        ],
      ),
    );
  }

  Widget _buildCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(albumItemBorderRadius),
      child: Container(
        width: 100.0,
        height: 100.0,
        child: Hero(
          tag: id,
          child: Material(
            type: MaterialType.transparency,
            child: (albumCover != null)
              ? albumCover.isNotEmpty
                ? Image.memory(albumCover)
                : _buildCoverPlaceholder(title)
              : (albumArt != null)
                ? Image.file(File(albumArt))
                : _buildCoverPlaceholder(title),
          )
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
}