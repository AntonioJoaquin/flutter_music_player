import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_music_player/domain/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlbums();

    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.albums.length,
            itemBuilder: (_, index) => 
              ListTile(
                title: Text('${controller.albums[index].title}'),
              ) 
          );
        } 
      )
    );
  }
}