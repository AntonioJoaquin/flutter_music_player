import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/arguments/album_argument.dart';
import 'package:get/get.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({Key key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  String _id;

  @override
  void initState() {
    _id = (Get.arguments as AlbumArguments).albumId;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child: Center(child: Text('Album $_id Page'),),
      ),
    );
  }
}