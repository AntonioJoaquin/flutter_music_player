import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  RxList<Album> albums = RxList<Album>();

  void getAlbums() async {
    albums = RxList.from(await Get.find<FileRepository>().getDeviceAlbums());

    update();
  }
}