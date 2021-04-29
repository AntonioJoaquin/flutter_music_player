import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/resources/colors.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_music_player/ui/widgets/media_grid_widget.dart';
import 'package:flutter_music_player/domain/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlbums();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.music, color: primaryColor,),
                        SizedBox(width: 8.0,),
                        Text(
                          'Fluyer Music',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: primaryColor
                          ),
                        )
                      ],
                    ),
                    Icon(FontAwesomeIcons.search, color: primaryColor,)
                  ],
                ),
              ),
              GetBuilder<HomeController>(
                builder: (controller) {
                  return controller.isLoading
                    ? Center(child: CircularProgressIndicator())
                    :  Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight * 2),
                      child: MediaGrid(albums: controller.albums,),
                    );
                } 
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: kBottomNavigationBarHeight * 1.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}