import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_music_player/ui/widgets/media_grid_widget.dart';
import 'package:flutter_music_player/domain/controller/home_controller.dart';
import 'package:flutter_music_player/ui/resources/index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAlbums();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: commonPadding),
          child: Stack(
            children: [
              _buildAppBar(),

              _buildBody(),

              _buildBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(commonPadding),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.headphones, 
                  size: mainIconSize,
                  color: primaryColor,
                ),

                SizedBox(width: iconTextWidth,),

                Text(
                  'Fluyer Music',
                  style: TextStyle(
                    fontSize: appTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                )
              ],
            ),

            Icon(FontAwesomeIcons.search, color: primaryColor,)
          ],
        ),
    );
  }

  Widget _buildBody() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight * 2),
            child: MediaGrid(albums: controller.albums,),
          );
      } 
    );
  }

  Widget _buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(commonPadding),
        child: Container(
          height: bottomNavigationBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bottomNavigationBarBorderRadius),
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}