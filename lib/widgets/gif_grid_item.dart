import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/gif.dart';
import '../views/single_gif_page.dart';

class GifGridItem extends StatelessWidget {
  final Gif gif;
  final Function redrawFavoritesPage;

  GifGridItem({this.gif, this.redrawFavoritesPage});

  void _pushSingleGifPage(BuildContext context) async {
    final previousPageIsFavoritesPage = redrawFavoritesPage != null;

    final routeToSingleGifPage =
        MaterialPageRoute(builder: (context) => SingleGifPage(gif: this.gif));

    final favoriteStateChanged =
        await Navigator.push(context, routeToSingleGifPage);

    if (previousPageIsFavoritesPage && favoriteStateChanged) {
      print(' > The state of a GIF changed. Redrawing page...');
      this.redrawFavoritesPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final gifImage = FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: this.gif.url,
      height: 300.0,
      fit: BoxFit.cover,
    );

    return GestureDetector(
        onLongPress: () => Share.share(this.gif.url),
        onTap: () => _pushSingleGifPage(context),
        child: gifImage);
  }
}
