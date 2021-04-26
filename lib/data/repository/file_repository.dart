import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_music_player/domain/entity/album.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  final FlutterAudioQuery flutterAudioQuery;

  FileRepositoryImpl({ this.flutterAudioQuery });

  @override
  Future<List<Album>> getDeviceAlbums() async {
    List<AlbumInfo> albums = await flutterAudioQuery.getAlbums();

    return albums.map((album) => 
      Album(
        title: album.title,
        cover: album.albumArt,
        artist: album.artist,
        numberOfSongs: album.numberOfSongs
      )
    ).toList();
  }
}