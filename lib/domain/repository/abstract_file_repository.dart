import 'package:flutter_music_player/domain/entity/album.dart';

abstract class FileRepository {
  /*
   * Get device storage albums
   * 
   * [return] List of device storage albums
   */
  Future<List<Album>> getDeviceAlbums();
}