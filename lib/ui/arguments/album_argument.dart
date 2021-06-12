import 'dart:typed_data';

import 'package:flutter/material.dart';

class AlbumArguments {
  final String albumId;
  final String albumTitle;
  final Uint8List albumCover;
  final String albumArt;

  AlbumArguments({ 
    @required this.albumId,
    @required this.albumTitle,
    @required this.albumCover,
    @required this.albumArt
  });
}