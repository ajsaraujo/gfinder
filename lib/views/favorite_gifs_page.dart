import 'package:flutter/material.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import 'package:gfinder/control/navigation_mode.dart';
import 'package:gfinder/widgets/gif_grid_view.dart';
import '../widgets/my_scaffold.dart';

class FavoriteGifsPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {    
    final favoriteGifs = FavoriteGifs();
    final gifList = favoriteGifs.favoriteGifList();

    print('You marked ${gifList.length} gifs as favorites');
    return MyScaffold(
      title: 'Favorite GIFs',
      body: Column(
        children: <Widget>[
          Expanded(
            child: GifGridView(
              gifList: favoriteGifs.favoriteGifList(),
              navigationMode: NavigationMode.trending,
            )
          )
        ],
      )
    );
  }
}