import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../control/favorite_gifs.dart';
import '../models/gif.dart';

class GifActionsRow extends StatefulWidget {
  final Gif gif;

  GifActionsRow({this.gif});

  @override
  _GifActionsRowState createState() => _GifActionsRowState();
}

class _GifActionsRowState extends State<GifActionsRow> {
  final _favoriteController = FavoriteGifs();

  void _toggleFavorite(bool isFavorite) {
    setState(() {
      if (isFavorite) {
        _favoriteController.removeGifFromFavorites(this.widget.gif.id);
      } else {
        _favoriteController.markGifAsFavorite(
            this.widget.gif.id, this.widget.gif.url, this.widget.gif.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = _favoriteController.isFavorite(this.widget.gif.id);

    final favoriteIcon = IconButton(
        icon: isFavorite
            ? Icon(Icons.favorite, color: Colors.red, size: 50.0)
            : Icon(Icons.favorite_border, color: Colors.white, size: 50.0),
        onPressed: () {
          _toggleFavorite(isFavorite);
        });

    final shareIcon = IconButton(
        icon: Icon(Icons.share, color: Colors.white, size: 50.0),
        onPressed: () {
          Share.share(this.widget.gif.url);
        });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[favoriteIcon, shareIcon],
    );
  }
}
