import 'package:flutter/material.dart';
import 'package:gfinder/views/single_gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGridItem extends StatelessWidget {
  final String gifUrl;
  final String gifTitle;
  final String gifId;

  GifGridItem({this.gifUrl, this.gifTitle, this.gifId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          Share.share(gifUrl);
        },
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleGifPage(
                        gifUrl: this.gifUrl,
                        gifTitle: this.gifTitle,
                        gifId: this.gifId,
                      )));
        },
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: gifUrl,
          height: 300.0,
          fit: BoxFit.cover,
        ));
  }
}
