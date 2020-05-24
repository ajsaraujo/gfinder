import 'package:flutter/material.dart';
import 'package:gfinder/models/gif.dart';
import 'package:gfinder/views/single_gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGridItem extends StatelessWidget {
  final Gif gif;

  GifGridItem({this.gif});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          Share.share(this.gif.url);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleGifPage(gif: this.gif)));
        },
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: this.gif.url,
          height: 300.0,
          fit: BoxFit.cover,
        ));
  }
}
