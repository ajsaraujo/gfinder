import 'package:flutter/material.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import '../widgets/my_scaffold.dart';

class FavoriteGifsPage extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {    
    final favoriteGifs = FavoriteGifs();
    final gifList = favoriteGifs.gifList;

    print('You marked ${gifList.length} gifs as favorites');
    return MyScaffold(
      title: 'Favorite GIFs',
      body: Container()
    );
  }
}