import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:flutter_music_player/ui/pages/home_page.dart';

void main() {
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
        GetPage(name: '/', page: () => HomePage())
      ],
    );
  }
}
