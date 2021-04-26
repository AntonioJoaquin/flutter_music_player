import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

import 'package:flutter_music_player/data/repository/file_repository.dart';
import 'package:flutter_music_player/domain/binding/home_binding.dart';
import 'package:flutter_music_player/domain/repository/abstract_file_repository.dart';

import 'package:flutter_music_player/ui/pages/home_page.dart';

void main() {
  Get.put<FileRepository>(FileRepositoryImpl(flutterAudioQuery: FlutterAudioQuery()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fluyer Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: HomeBinding())
      ],
    );
  }
}
