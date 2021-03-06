import 'package:flutter/material.dart';
import '../control/favorite_gifs.dart';
import '../control/navigation_mode.dart';
import '../widgets/gif_grid_view.dart';
import '../widgets/my_scaffold.dart';

class FavoriteGifsPage extends StatefulWidget {
  @override
  _FavoriteGifsPageState createState() => _FavoriteGifsPageState();
}

class _FavoriteGifsPageState extends State<FavoriteGifsPage> {
  @override
  Widget build(BuildContext context) {    
    final favoriteGifs = FavoriteGifs();
    final gifList = favoriteGifs.favoriteGifList();

    print(' > You marked ${gifList.length} gifs as favorites!');
    return MyScaffold(
      title: 'Favorite GIFs',
      body: Column(
        children: <Widget>[
          Expanded(
            child: GifGridView(
              redrawFavoritesPage: () { setState(() {}); },
              gifList: favoriteGifs.favoriteGifList(),
              navigationMode: NavigationMode.favorites,
            )
          )
        ],
      )
    );
  }
}