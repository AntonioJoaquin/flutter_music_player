import 'package:get/get.dart';

import 'package:flutter_music_player/domain/controller/album_controller.dart';

class AlbumBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumController());
  }
}