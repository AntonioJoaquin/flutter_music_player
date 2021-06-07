import 'dart:typed_data';

import 'package:flutter/material.dart';

class Album {
  final String id;
  final String title;
  final Uint8List cover; // Covers for android sdk >= 29
  final String albumArt; // Covers for android sdk < 29
  final String artist;
  final String numberOfSongs;

  Album({
    @required this.id,
    @required this.title, 
    this.cover,
    this.albumArt,
    @required this.artist, 
    @required this.numberOfSongs
  });
}