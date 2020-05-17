import 'package:flutter/material.dart';
import 'package:gfinder/views/single_gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGridItem extends StatelessWidget {
  final gifData;

  GifGridItem({this.gifData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          Share.share(gifData['images']['fixed_height']['url']);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleGifPage(
                        gifData: this.gifData,
                      )));
        },
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: this.gifData['images']['fixed_height']['url'],
          height: 300.0,
          fit: BoxFit.cover,
        ));
  }
}
