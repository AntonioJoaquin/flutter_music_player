import 'package:flutter/material.dart';

class Album {
  final String title;
  final String cover;
  final String artist;
  final String numberOfSongs;

  Album({
    @required this.title, 
    @required this.cover, 
    @required this.artist, 
    @required this.numberOfSongs
  });
}