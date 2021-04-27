import 'dart:typed_data';

import 'package:flutter/material.dart';

class Album {
  final String id;
  final String title;
  final Uint8List cover;
  final String artist;
  final String numberOfSongs;

  Album({
    @required this.id,
    @required this.title, 
    @required this.cover, 
    @required this.artist, 
    @required this.numberOfSongs
  });
}