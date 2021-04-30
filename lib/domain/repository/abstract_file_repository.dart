import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/domain/entity/song.dart';

abstract class FileRepository {
  /*
   * Get device storage albums
   * 
   * [return] List of device storage albums
   */
  Future<List<Album>> getDeviceAlbums();
  
  /*
   * Get songs of a specific album
   * 
   * [param] String id: The album id whose songs we want to get
   * [return] List of album songs
   */
  Future<List<Song>> getAlbumSongs(String id);
}