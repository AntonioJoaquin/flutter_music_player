import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/ui/widgets/media_grid_widget.dart';

import 'package:get/get.dart';

import 'package:flutter_music_player/domain/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlbums();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              :  MediaGrid(albums: controller.albums,);
          } 
        ),
      )
    );
  }
}