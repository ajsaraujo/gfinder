import 'package:flutter/material.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import 'package:share/share.dart';

class GifActionsRow extends StatefulWidget {
  final String gifTitle;
  final String gifUrl;

  GifActionsRow({this.gifUrl, this.gifTitle});

  @override
  _GifActionsRowState createState() => _GifActionsRowState();
}

class _GifActionsRowState extends State<GifActionsRow> {
  final _favoriteController = FavoriteGifs();

  /*void _toggleFavorite(bool isFavorite) {
    setState(() {
      if (isFavorite) {
        _favoriteController.removeGifFromFavorites(this.widget.gifUrl);
      } else {
        _favoriteController.markGifAsFavorite(
            this.widget.gifUrl, this.widget.gifTitle);
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = _favoriteController.isFavorite(this.widget.gifUrl);

    final favoriteIcon = IconButton(
        icon: isFavorite
            ? Icon(Icons.favorite, color: Colors.red, size: 50.0)
            : Icon(Icons.favorite_border, color: Colors.white, size: 50.0),
        onPressed: () {
          //_toggleFavorite(isFavorite);
        });

    final shareIcon = IconButton(
        icon: Icon(Icons.share, color: Colors.white, size: 50.0),
        onPressed: () {
          Share.share(this.widget.gifUrl);
        });
        
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[favoriteIcon, shareIcon],
    );
  }
}
