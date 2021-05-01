import 'package:get/get.dart';

import 'package:flutter_music_player/domain/entity/song.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';

class AlbumController extends GetxController {
  bool isLoading = false.obs();

  List<Song> songs = [];

  void getAlbumsSongs(String id) async {
    isLoading = true;
    songs = []; // await Get.find<FileRepository>().getAlbumSongs(id);

    isLoading = false;

    update();
  }
}