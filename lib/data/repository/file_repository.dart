import 'dart:typed_data';

import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/domain/entity/song.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FlutterAudioQuery flutterAudioQuery;

  FileRepositoryImpl({ this.flutterAudioQuery });

  @override
  Future<List<Album>> getDeviceAlbums() async {
    List<AlbumInfo> albumsInfo = await flutterAudioQuery.getAlbums();
    List<Uint8List> covers = [];
    List<Album> albums = [];

    for (AlbumInfo album in albumsInfo) {
      covers.add(await flutterAudioQuery.getArtwork(type: ResourceType.ALBUM, id: album.id));
    }

    for (int i = 0; i < albumsInfo.length; i++) {
      albums.add(Album(
        id: albumsInfo[i].id,
        title: albumsInfo[i].title,
        cover: covers[i],
        artist: albumsInfo[i].artist,
        numberOfSongs: albumsInfo[i].numberOfSongs
      ));
    }

    return albums;
  }

  @override
  Future<List<Song>> getAlbumSongs(String id) async {
    List<SongInfo> songs =  await flutterAudioQuery.getSongsFromAlbum(albumId: id);
    return songs.map((song) => Song(
      title: song.displayName,
      albumCover: song.albumArtwork
    )).toList();
  }
}