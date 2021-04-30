import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isLoading = false.obs();

  List<Album> albums = [];

  void getAlbums() async {
    isLoading = true;
    albums = await Get.find<FileRepository>().getDeviceAlbums();

    isLoading = false;

    update();
  }
}