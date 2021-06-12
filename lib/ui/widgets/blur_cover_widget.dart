import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

class BlurCover extends StatelessWidget {
  final Uint8List albumCover;
  final String albumArt;

  const BlurCover({
    Key key,
    this.albumCover,
    this.albumArt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: ((albumCover != null && albumCover.isNotEmpty) || albumArt != null)
          ? _buildCover()
          : null,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(.0)),
        ),
      ),
    );
  }

  DecorationImage _buildCover() {
    return DecorationImage(
      image: (albumCover != null && albumCover.isNotEmpty)
        ? MemoryImage(albumCover)
        : FileImage(File(albumArt)),
      fit: BoxFit.cover
    );
  }
}