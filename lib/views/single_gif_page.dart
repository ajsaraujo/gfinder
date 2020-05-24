import 'package:flutter/material.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import 'package:gfinder/models/gif.dart';
import 'package:gfinder/widgets/gif_actions_row.dart';
import 'package:gfinder/widgets/my_scaffold.dart';

class SingleGifPage extends StatelessWidget {
  final Gif gif;
  SingleGifPage({this.gif});

  @override
  Widget build(BuildContext context) {

    final favoriteGifs = FavoriteGifs();
    final bool wasFavorite = favoriteGifs.isFavorite(this.gif.id);
    
    final goBackButton = IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        final bool isFavorite = favoriteGifs.isFavorite(this.gif.id);
        final bool favoriteStateChanged = isFavorite != wasFavorite;
        Navigator.of(context).pop(favoriteStateChanged);
      },
    );
    
    return MyScaffold(
        leading: goBackButton,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.gif.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            SizedBox(height: 20.0),
            Image.network(this.gif.url),
            SizedBox(height: 20.0),
            GifActionsRow(
              gif: this.gif
            ),
          ],
        ));
  }
}
