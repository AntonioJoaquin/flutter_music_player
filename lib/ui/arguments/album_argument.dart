import 'dart:typed_data';

import 'package:flutter/material.dart';

class AlbumArguments {
  final String albumId;
  final String albumTitle;
  final Uint8List albumCover;

  AlbumArguments({ 
    @required this.albumId,
    @required this.albumTitle,
    @required this.albumCover
  });
}