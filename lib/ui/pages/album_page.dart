import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/arguments/album_argument.dart';
import 'package:flutter_music_player/ui/resources/index.dart';

import 'package:get/get.dart';

import 'package:flutter_music_player/domain/controller/album_controller.dart';
import 'package:flutter_music_player/ui/widgets/media_list_widget.dart';

class AlbumPage extends GetView<AlbumController> {
  final String id = (Get.arguments as AlbumArguments).albumId;
  final String title = (Get.arguments as AlbumArguments).albumTitle;
  final Uint8List albumCover = (Get.arguments as AlbumArguments).albumCover;

  AlbumPage({Key key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    controller.getAlbumsSongs(id);
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(albumItemBorderRadius),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: Hero(
                          tag: id,
                          child: Image.memory(albumCover)
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0,),
                    Flexible(
                      child: Text(title),
                    )
                  ],
                ),
              ),
              GetBuilder<AlbumController>(
                builder: (controller) {
                  return controller.isLoading
                    ? Center(child: CircularProgressIndicator(),)
                    : MediaList(songs: controller.songs,);
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}