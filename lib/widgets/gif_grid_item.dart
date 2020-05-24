import 'package:flutter/material.dart';
import 'package:gfinder/models/gif.dart';
import 'package:gfinder/views/single_gif_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGridItem extends StatelessWidget {
  final Gif gif;
  final Function redrawFavoritesPage;

  GifGridItem({this.gif, this.redrawFavoritesPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          Share.share(this.gif.url);
        },
        onTap: () async {
          final favoriteStateChanged = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleGifPage(gif: this.gif)));
          if (this.redrawFavoritesPage != null && favoriteStateChanged) {
            print(' > É preciso redesenhar a página!');
          } else {
            print(' > Não é preciso redesenhar a página!');
          }
        },
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: this.gif.url,
          height: 300.0,
          fit: BoxFit.cover,
        ));
  }
}
